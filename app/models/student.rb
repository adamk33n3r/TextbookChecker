class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
  #has_secure_password
  #validates :username, :presence => true, :uniqueness => true, :length => {:maximum => 25}
  validates :email, :presence => true, :uniqueness => true, :format =>  /\A[^@\s]+@(?:[-a-z0-9]+\.)+[a-z]{2,}\z/i #/\A([^@\s]+)@taylor\.edu\z/i
  #validates :password, :length => {:minimum => 6}
  #validates_presence_of :year
  #validates_inclusion_of :verified, :admin, :in => [true, false]
  before_validation :set_username
  
  has_many :courses
  has_many :ratings
  
  def set_username
    self.username = (/([a-z_]*)\d*@/.match self.email)[1]
  end
  
  def to_param
    username
  end
  
  def to_s
    username.titleize
  end
end
