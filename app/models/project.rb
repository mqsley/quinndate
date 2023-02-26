class Project < ApplicationRecord
  belongs_to :user

  has_many :subscribers
  has_many :stakeholder_updates

  scope :ready, -> { where.not(title: nil).where.not(description: nil).where.not(website: nil) }

  def self.except(project)
    Project.where.not(id: project.id)
  end

end
