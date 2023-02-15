class Project < ApplicationRecord
  belongs_to :user

  has_many :subscriptions
  has_many :stakeholder_updates
end
