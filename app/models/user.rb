class User < ActiveRecord::Base
  has_secure_password
  validates :username, :presence => true
  validates :email, :presence => true, :format =>  /\A([^@\s]+)@taylor\.edu\z/i
  validates :password, :length => {:minimum => 6}
  validates :verified, :inclusion => [true, false]
  def to_param
    username
  end
end
