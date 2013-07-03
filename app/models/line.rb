class Line < ActiveRecord::Base
  attr_accessible :data

  validates_presence_of :data
end
