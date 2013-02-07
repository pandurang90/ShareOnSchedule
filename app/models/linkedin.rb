class Linkedin < ActiveRecord::Base
  attr_accessible :content, :post_time, :user_id
  validates_presence_of :content
  validates_presence_of :post_time
  belongs_to :user


protected
  def schedule_share
   	#LinkedinWorker.perform_at(post_time,current_user.oauth_token,current_user.oauth_token_secret,share)
  end
end