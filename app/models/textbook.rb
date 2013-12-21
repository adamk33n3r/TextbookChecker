class Textbook < ActiveRecord::Base
  has_many :course_textbooks
  has_many :courses, through: :course_textbooks
end
