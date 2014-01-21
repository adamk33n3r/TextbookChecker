class TextbookAssociation < ActiveRecord::Base
  belongs_to :professor
  belongs_to :course
  belongs_to :textbook
  has_many :ratings
end
