class Contact < ActiveRecord::Base
  # References
  belongs_to :client
  has_many :projects
  
end
