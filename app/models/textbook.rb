class Textbook < ActiveRecord::Base
  has_many :textbook_associations
  has_many :courses, through: :textbook_associations
  has_many :professors, through: :textbook_associations
  
  validates_presence_of :title, :authors, :edition, :price, :isbn, :description, :image_url, :published

  def to_s
    self.title
  end
end
