class Vote < ActiveRecord::Base
  validates_presence_of :method
end
