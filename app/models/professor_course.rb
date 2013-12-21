class ProfessorCourse < ActiveRecord::Base
  belongs_to :professor
  belongs_to :course
  
  validates_presence_of :professor, :course
end
