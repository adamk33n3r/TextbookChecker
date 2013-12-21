class StudentCourse < ActiveRecord::Base
  belongs_to :student
  belongs_to :course
  
  validates_presnece_of :student, :course
end
