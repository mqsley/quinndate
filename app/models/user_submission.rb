class UserSubmission < ApplicationRecord

  def name
    "#{first_name} #{last_name}"
  end

  PLAN_NAMES = ['free', 'pro']

  validates_presence_of :first_name, :last_name, :email, :website, :job_role, :text
  validates :plan_name, inclusion: { in: PLAN_NAMES }



end
