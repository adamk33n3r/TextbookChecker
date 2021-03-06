class StudentCourse < ActiveRecord::Base
  belongs_to :student
  belongs_to :course
  
  validates_presence_of :student, :course
end
