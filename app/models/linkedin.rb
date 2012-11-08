class Linkedin < ActiveRecord::Base
  attr_accessible :share, :post_time, :user_id
  validates_presence_of :share
  validates_presence_of :post_time
end