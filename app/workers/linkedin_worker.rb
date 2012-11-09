class LinkedinWorker

  def self.perform(user,linkedin)
    LinkedinMe.share(user,linkedin)
  end

end