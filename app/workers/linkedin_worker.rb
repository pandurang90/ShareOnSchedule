class LinkedinWorker

include Sidekiq::Worker
sidekiq_options :queue => :share_on_social
	def perform(token,secret,verifier,linkedin_id)
    @linkedin=linkedin.find(linkedin_id)
    post_share = LinkedinMe.new(token,secret,verifier)
    post_share.share(@linkedin.content)
  end
end