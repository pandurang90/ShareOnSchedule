class ShareTweet

  def self.perform(user,tweet)
    user = Twitter::Client.new(
    :consumer_key => TWITTER_CONSUMER_KEY,
    :consumer_secret => TWITTER_CONSUMER_SECRET,
    :oauth_token => user.oauth_token,
    :oauth_token_secret => user.oauth_token_secret
    ) 
    
    Twitter.update(tweet)  
  end


end