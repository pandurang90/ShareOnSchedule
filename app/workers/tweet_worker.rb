class TweetWorker

  def self.perform(user,tweet)
    TweetMe.publish(user,tweet)
  end

end