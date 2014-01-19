class Rating < ActiveRecord::Base
  belongs_to :vote
  belongs_to :student
  belongs_to :course_textbook
  
  validates_presence_of :vote, :student, :course_textbook

  delegate :textbook, to: :course_textbook
  delegate :course, to: :course_textbook
  
  def to_s
    self.course_textbook
  end
  
end
