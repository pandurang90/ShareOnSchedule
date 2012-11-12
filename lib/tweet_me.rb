class TweetMe
  attr_accessor :token, :secret
  
  def initialize(token,secret)
    @token = token
    @secret = secret
  end

  def post(text)
    user = Twitter::Client.new(
      :consumer_key => "2lPup6YS8TaC9WKNOwj0g",
      :consumer_secret => "YiNbL9ossS70oZCNNvqKbz4oi2zE4ugfO5fdI9J6A0",
      :oauth_token => @token,
      :oauth_token_secret => @secret
      ) 
    user.update(text)  
  end

  def change_state()
  end
end