module TweetsHelper
  def status(tweet)
    if !tweet.is_tweeted 
      "Not yet tweeted" 
    else 
      "Tweeted" 
    end
  end
end