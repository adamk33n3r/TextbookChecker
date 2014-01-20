class Professor < ActiveRecord::Base
  has_many :textbook_associations
  has_many :courses, through: :textbook_associations
  has_many :textbooks, through: :textbook_associations
  validates_presence_of :first_name, :last_name, :department, :title
  
  def to_s
    self.title +  " " + self.first_name + " " + self.last_name
  end
end
