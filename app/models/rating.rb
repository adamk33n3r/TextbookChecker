class Rating < ActiveRecord::Base
  belongs_to :vote
  belongs_to :student
  belongs_to :textbook_association
  
  validates_presence_of :vote, :content, :student, :textbook_association

  delegate :textbook, to: :textbook_association
  delegate :course, to: :textbook_association
  delegate :professor, to: :textbook_association
  
  def to_s
    self.vote
  end
  
end
