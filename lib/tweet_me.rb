class TweetMe
  attr_accessor :token, :secret
  
  def initialize(token,secret)
    @token = token
    @secret = secret
  end

  def post(text)
    user = Socialshare::Tweeter.new(:consumer_key => "2lPup6YS8TaC9WKNOwj0g", 
                        :consumer_secret => "YiNbL9ossS70oZCNNvqKbz4oi2zE4ugfO5fdI9J6A0",
                        :token => self.token, 
                        :secret => self.secret)
    user.post(text)  
  end

  def change_state()
  end
end