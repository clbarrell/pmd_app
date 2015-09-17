class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :project_splits
  has_many :projects, through: :project_splits

  before_save :case_of_things

  # Validations
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :initials, presence: true, length: { is: 3 }
  validates :admin, :inclusion => {:in => [true, false]}


  private
    # Ensure cases are proper!
    def case_of_things
      initials.upcase!
      email.downcase!
    end



end