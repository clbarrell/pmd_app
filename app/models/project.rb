class Project < ActiveRecord::Base
  belongs_to :client
  belongs_to :contact
  has_many :project_splits
  has_many :users, through: :project_splits
end
