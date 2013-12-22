class Textbook < ActiveRecord::Base
  has_many :course_textbooks
  has_many :courses, through: :course_textbooks
  
  validates_presence_of :title, :authors, :edition, :price, :isbn, :description, :image_url, :published
    
  before_validation :get_info
  
  def get_info
    
  end

end
