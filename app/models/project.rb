class Project < ActiveRecord::Base
  belongs_to :client
  belongs_to :contact
  has_many :project_splits
  has_many :users, through: :project_splits

  # Validations

  validates :name, presence: true
  validates :job_number, numericality: { only_integer: true }
  validates :total, numericality: true
  validates :probability, numericality: true
  validates :service_line, inclusion: { in: %w(Performance Transformation Wellbeing Leadership), message: "Invalid service line. Has to be either Performance, Transformation, Wellbeing or Leadership." }
  validates :project_type, inclusion: { in: %w(Proposal Guaranteed), message: "Invalid project type."}
  validates :suitable_reference, :inclusion => {:in => [true, false] }
  validates :client, presence: true
  validates :contact, presence: true
  validates :status, inclusion: { in: %w(Active Delayed Complete Inactive) }



end
