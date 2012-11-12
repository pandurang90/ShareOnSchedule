class Tweet < ActiveRecord::Base
  attr_accessible :content, :tweet_time, :user_id
  validates_presence_of :content
  validates_presence_of :tweet_time
  belongs_to :user

  #after_create :schedule_tweet

  protected
    def schedule_tweet
      TweetWorker.perform_at(tweet_time,current_user.token,current_user.secret,@tweet.content)
    end

end


