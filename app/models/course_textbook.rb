class CourseTextbook < ActiveRecord::Base
  belongs_to :course
  belongs_to :textbook
  
  has_many :ratings
  
  validates_presence_of :course, :textbook
  
  def to_s
    self.course.to_s + " - " + self.textbook.to_s
  end
end
