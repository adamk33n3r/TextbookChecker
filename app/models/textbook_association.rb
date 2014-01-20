class TextbookAssociation < ActiveRecord::Base
  belongs_to :professor, :course, :textbook
  has_many :ratings
end
