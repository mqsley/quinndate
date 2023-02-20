class UserSubmissionsController < ApplicationController
  def create
    UserSubmission.create!(user_submission_params)
    redirect_to root_path, notice: 'Great job, thanks for applying'
  end


  def user_submission_params
    params.require(:user_submission).permit(:first_name, :last_name, :email, :website, :job_role, :text, :plan_name)
  end


end
