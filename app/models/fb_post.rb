class FbPost < ActiveRecord::Base
  attr_accessible :content, :is_posted, :post_time, :user_id
  
  after_save :schedule_tweet
  after_update :schedule_share

protected
  def schedule_share
    #FbPostWorker.perform_at(post_time,current_user.oauth_token,current_user.oauth_token_secret,share)
  end
end
