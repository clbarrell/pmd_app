class Project < ActiveRecord::Base
  belongs_to :client
  belongs_to :contact
  has_many :project_splits, :dependent => :destroy
  has_many :users, through: :project_splits

  accepts_nested_attributes_for :project_splits

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


  # Automatically Insert New Job Number
  def newjobnum
    write_attribute(:job_number, (Project.maximum("job_number") + 1))
  end

  # Return names of coordinators
  def coordinators
    coord_splits = self.project_splits.where(role: "Coordinator")
    names = []
    if coord_splits.any?

      # put names into array
      coord_splits.each do |x|
        names << x.user.name
      end
      # Return names in array
      names
    else
      names << "None"
    end
  end

  # Return sales as array
  def sales_splits
    salessplit = self.project_splits.where(role: "Sales")
    sales =[]
    if salessplit.any?

      # put names into array
      salessplit.each do |x|
        sales << "#{x.user.name}, #{x.percentage}%"
      end
      # Return names in array
      sales
    else
      sales << "None"
    end
  end

  # Return names of involved people
  def involved_users
    involv_splits = self.project_splits.where(role: "Involved")
    names = []
    if involv_splits.any?

      # put names into array
      involv_splits.each do |x|
        names << x.user.name
      end
      # Return names in array
      names
    else
      names << "None"
    end
  end

end
