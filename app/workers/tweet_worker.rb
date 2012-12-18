class TweetWorker
  
  include Sidekiq::Worker
  
  def perform(token,secret,tweet_id)
    tweet=Tweet.find(tweet_id)
    post_tweet=TweetMe.new(token,secret)
    post_tweet.post(tweet.content)
    tweet.update_attributes(:is_tweeted => true)
  end
end