class User < ActiveRecord::Base
  has_many :project_splits
  has_many :projects, through: :project_splits
  
  # Validations
  validates :name, presence: true
  validates :email, presence: true
  validates :initials, presence: true
end 