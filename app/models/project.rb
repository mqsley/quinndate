class Project < ApplicationRecord
  belongs_to :user

  has_many :subscribers
  has_many :stakeholder_updates
end
