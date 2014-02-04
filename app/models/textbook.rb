class Textbook < ActiveRecord::Base
  has_many :textbook_associations, dependent: :delete_all
  has_many :courses, -> { uniq }, through: :textbook_associations
  has_many :professors, -> { uniq }, through: :textbook_associations
  
  validates_presence_of :title, :authors, :edition, :price, :isbn, :description, :image_url, :published, :g_link
  
  def ebook?
    is_ebook
  end
  
  def to_s
    self.title
  end
end
