class Textbook < ActiveRecord::Base
  has_many :course_textbooks
  has_many :courses, through: :course_textbooks
  
  validates_presence_of :title, :authors, :edition, :price, :isbn, :description, :image_url, :published

  def to_s
    self.title
  end
end
