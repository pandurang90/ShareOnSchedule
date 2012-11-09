class Tweet < ActiveRecord::Base
  attr_accessible :content, :tweet_time, :user_id
  validates_presence_of :content
  validates_presence_of :tweet_time
  belongs_to :user
end