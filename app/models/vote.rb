class Vote < ActiveRecord::Base
  validates_presence_of :method
  
  def to_s
    self.method
  end
end
