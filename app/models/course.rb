class Course < ActiveRecord::Base
  has_many :student_courses
  has_many :students, through: :student_courses
  
  has_many :professor_courses
  has_many :professors, through: :professor_courses
  
  has_many :course_textbooks
  has_many :textbooks, through: :course_textbooks
  
  validates_presence_of :title, :letters, :number
  
  def course
    self.letters + self.number.to_s
  end
  
  def to_s
    self.course
  end
end
