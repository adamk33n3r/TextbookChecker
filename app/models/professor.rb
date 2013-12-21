class Professor < ActiveRecord::Base
  has_many :professor_courses
  has_many :courses, through: :professor_courses
  validates_presence_of :first_name, :last_name, :department, :title
  
  def to_s
    self.title +  " " + self.first_name + " " + self.last_name
  end
end
