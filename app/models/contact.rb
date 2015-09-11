class Contact < ActiveRecord::Base
  # References
  belongs_to :client
  has_many :projects
  
  # Validations
  validates :name, presence: true
  validates :client, presence: true
end
