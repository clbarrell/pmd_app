class User < ActiveRecord::Base
  has_many :project_splits
  has_many :projects, through: :project_splits
end
