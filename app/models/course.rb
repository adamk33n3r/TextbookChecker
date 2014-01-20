class Course < ActiveRecord::Base
  has_many :student_courses
  has_many :students, through: :student_courses
  
  has_many :textbook_associations
  has_many :professors, through: :textbook_associations
  has_many :textbooks, through: :textbook_associations
  
  validates_presence_of :title, :letters, :number
  
  def course
    self.letters + self.number.to_s
  end
  
  def to_s
    self.course
  end
end
