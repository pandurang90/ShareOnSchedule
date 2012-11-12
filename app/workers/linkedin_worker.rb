class LinkedinWorker

  def self.perform(token,secret,verifier,linkedin)
    post_share = LinkedinMe.new(token,secret,verifier)
    post_share.share(linkedin)
  end

end