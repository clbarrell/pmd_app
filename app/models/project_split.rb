class ProjectSplit < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  
  
  validates :role, inclusion: { in: %w(Sales Coordinator Involved),
    message: "Type must be either Sales, Coordinator, Involved" }
  validates :user, :project, presence: true
  validates :percentage, numericality: true, allow_nil: true
  
  
  
  
  
end
