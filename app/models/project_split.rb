class ProjectSplit < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  # Attribute anymore checks to see if they want to add another split
  attr_accessor :anymore

  #initialise false anymore
  before_create :default_values

  validates :role, inclusion: { in: %w(Sales Coordinator Involved),
    message: "Type must be either Sales, Coordinator, Involved" }
  validates :user, :project, presence: true
  validates :percentage, numericality: true, allow_nil: true
  # Validate the percentage thing
  validate :percentage_needed



  private

    # Sets the anymore default value
    def default_values
      self.anymore ||= false
    end

    # Add error if percentage req but not present
    def percentage_needed
      if role == "Sales" && !percentage
        errors.add(:percentage, "Percentage required for sales split.")
      end
    end

end
