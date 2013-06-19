class Tweet < ActiveRecord::Base
  attr_accessible :content, :post_time, :user_id,:is_tweeted
  validates_presence_of :content
  validates_presence_of :post_time
  belongs_to :user

  protected
    def schedule_tweet
      #TweetWorker.perform_at(tweet_time,current_user.oauth_token,current_user.oauth_token_secret,content)
    end
end