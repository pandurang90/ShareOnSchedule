class LinkedinWorker

include Sidekiq::Worker

	def perform(token,secret,verifier,linkedin_id)
    @linkedin=linkedin.find(linkedin_id)
    post_share = LinkedinMe.new(token,secret,verifier)
    post_share.share(@linkedin.content)
  end
end