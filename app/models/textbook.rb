class Textbook < ActiveRecord::Base
  belongs_to :courses
  validates :title, :presence => true, :uniqueness => true
  validates :authors, :presence => true, :uniqueness => true
  validates :edition, :uniqueness => true
  validates :isbn, :presence => true, :uniqueness => true, :length => {:is => 13}
  validates :price, :presence => true, :format => /\A\d+(?:\.\d{0,2})?\z/
end
