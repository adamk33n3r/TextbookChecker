class Course < ActiveRecord::Base
  has_many :student_courses
  has_many :students, through: :student_courses
  
  has_many :textbook_associations, dependent: :delete_all
  has_many :professors, -> { uniq }, through: :textbook_associations
  has_many :textbooks, -> { uniq }, through: :textbook_associations
  
  validates_presence_of :title, :letters, :number
  
  def course
    self.letters + self.number.to_s
  end
  
  def to_s
    self.title
  end
end
