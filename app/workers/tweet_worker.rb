class TweetWorker
  include Sidekiq::Worker
  def perform(token,secret,tweet)
    post_tweet=TweetMe.new(token,secret)
    post_tweet.post(tweet)
  end

end