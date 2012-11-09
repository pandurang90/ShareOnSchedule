class TweetMe
  def publish(user,tweet)
  user = Twitter::Client.new(
    :consumer_key => TWITTER_CONSUMER_KEY,
    :consumer_secret => TWITTER_CONSUMER_SECRET,
    :oauth_token => user.oauth_token,
    :oauth_token_secret => user.oauth_token_secret
    )    
    user.update(tweet)  
  end
end