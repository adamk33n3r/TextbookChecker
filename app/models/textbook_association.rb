class TextbookAssociation < ActiveRecord::Base
  belongs_to :professor
  belongs_to :course
  belongs_to :textbook
  has_many :ratings, dependent: :delete_all
  
  # These validations prevent duplicates. I need these because I needed to add
  # an id attribute which would normally make them always unique.
  validates_uniqueness_of :professor, scope: [:course, :textbook]
  validates_uniqueness_of :course, scope: [:professor, :textbook]
  validates_uniqueness_of :textbook, scope: [:course, :professor]
  
  def to_s
    "Rating for #{self.textbook} in #{self.professor.to_s.possessive} #{self.course}"
  end
end
