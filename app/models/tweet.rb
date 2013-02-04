class Tweet < ActiveRecord::Base
  attr_accessible :content, :post_time, :user_id
  validates_presence_of :content
  validates_presence_of :post_time
  belongs_to :user
  after_save :schedule_tweet
  after_update :schedule_tweet

  protected
    def schedule_tweet
      #TweetWorker.perform_at(tweet_time,current_user.oauth_token,current_user.oauth_token_secret,content)
    end
end