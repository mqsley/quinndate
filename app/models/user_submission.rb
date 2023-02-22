class UserSubmission < ApplicationRecord
  PLAN_NAMES = ['free', 'pro']

  validates_presence_of :first_name, :last_name, :email, :website, :job_role, :text
  validates :plan_name, inclusion: { in: PLAN_NAMES }

  after_update :finish_processing

  def name
    "#{first_name} #{last_name}"
  end

  def generate_password
    SecureRandom.hex(10)
  end

  def accept!
    password = generate_password
    User.create!(email: self.email, password: password)
    UserSubmissionMailer.accept(self, password).deliver
  end

  def reject!
    UserSubmissionMailer.reject(self).deliver
  end



  def finish_processing
    puts "SENDING MAILER"
    reject! if status == 'Rejected'
    accept! if status == 'Accepted'

  end


end
