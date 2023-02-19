class UserSubmissionsController < ApplicationController
  def create

  end


  def user_submission_params
    params.require(:user_submission).permit(:first_name, :last_name, :email, :website) 
  end


end
