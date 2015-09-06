class Client < ActiveRecord::Base
  has_many :contacts
  has_many :projects
  # Self Reference
  has_many :groups, class_name: "Client",
                          foreign_key: "organisation_id"
  belongs_to :organisation, class_name: "Client"
  
  # VALIDATIONS  
  validates :name, presence: true, length: { maximum: 200 }
  
  
end
