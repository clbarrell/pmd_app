class User < ActiveRecord::Base
  has_many :project_splits
  has_many :projects, through: :project_splits
  
  # Validations
  validates :name, presence: true
  validates :email, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :initials, presence: true, length: { is: 3 }
end 