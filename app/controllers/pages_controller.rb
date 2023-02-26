class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:start, :logout]

  def home
  end

  def apply
  end

  def thanks
  end

  def magic_link
    user = User.find_by(auth_code: params[:auth_code])
      if user
        sign_in(user)
        redirect_to start_path
      else
        redirect_to user_session_path, alert: "bad link please sign in with your email and password"
      end
  end

  def start
    @project = current_user.default_project
    redirect_to dashboard_path if (@project.title? && @project.description?)
  end

  def logout
    sign_out(current_user)
    redirect_to root_path
  end

  def page
    @page_key = request.path[1..-1]
    render "pages/#{@page_key}"
  end
end
