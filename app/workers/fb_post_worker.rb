
class FbPostWorker
  
  include Sidekiq::Worker
  
  def perform(token,post_id)
    fb_post=FbPost.find(tweet_id)
    post = Koala::Facebook::API.new(token)
    post.put_wall_post(fb_post.content)
    fb_post.update_attributes(:is_posted => true)
  end
end
