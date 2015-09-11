class ProjectSplit < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  
  #validations
  #user: chris
  #project: workshop
  #role: sales
  #percentage: 80.0
  
  validates :role, inclusion: { in: %w(Sales Coordinator Involved),
    message: "Type must be either Sales, Coordinator, Involved" }
  validates :user, :project, presence: true
    
  #validates_associated :user, :project
  validates :percentage, numericality: true, allow_nil: true
  
  
  
  
  
  private
    # tests if percengage is valid when role is Sales
    def test_the_percentage
      if role == "Sales" && !(percentage.is_a? Numeric) 
        errors.add(:percentage, 'Sales split must be a valid percentage')
      end
    end
  
end
