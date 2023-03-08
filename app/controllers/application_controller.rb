class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    start_path
    # resource.paying_customer? ? dashboard_index_path : subscribe_index_path # point these wherever you want
	end

  def maybe_skip_onboarding
    redirect_to dashboard_index_path, notice: "You're already subscribed" if current_user.finished_onboarding?
  end

  def maybe_subscribe
    redirect_to subscribe_index_path unless current_user.has_started_subscription
  end

end
