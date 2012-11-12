class Linkedin < ActiveRecord::Base
  attr_accessible :share, :post_time, :user_id
  validates_presence_of :share
  validates_presence_of :post_time
  belongs_to :user
  after_save :schedule_share
  after_update :schedule_share

protected
  def schedule_share
   	#LinkedinWorker.perform_at(post_time,current_user.oauth_token,current_user.oauth_token_secret,share)
  end
end