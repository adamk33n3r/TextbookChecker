class CourseTextbook < ActiveRecord::Base
  belongs_to :course
  belongs_to :textbook
  
  has_many :ratings
  
  validates_presence_of :course, :textbook
end
