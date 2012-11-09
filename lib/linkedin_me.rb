class LinkedinMe
  def share(user,linkedin)
  user = Linkedin::Client.new(
    :consumer_key => LINKEDIN_CONSUMER_KEY,
    :consumer_secret => LINKEDIN_CONSUMER_SECRET,
    :oauth_token => user.oauth_token,
    :oauth_token_secret => user.oauth_token_secret
    ) 
    user.update(linkedin)  
  end
end