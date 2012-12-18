class LinkedinWorker

include Sidekiq::Worker

	def perform(token,secret,verifier,linkedin)
    post_share = LinkedinMe.new(token,secret,verifier)
    post_share.share(linkedin)
  end
end