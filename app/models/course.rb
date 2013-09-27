class Course < ActiveRecord::Base
  belongs_to :professors
  has_many :textbooks
end
