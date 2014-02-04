class Professor < ActiveRecord::Base
  has_many :textbook_associations, dependent: :delete_all
  has_many :courses, -> { uniq }, through: :textbook_associations
  has_many :textbooks, -> { uniq }, through: :textbook_associations
  validates_presence_of :first_name, :last_name, :department, :title
  
  def to_s
    self.title +  " " + self.first_name + " " + self.last_name
  end
end
