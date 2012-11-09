class Account < ActiveRecord::Base
  attr_accessible :provider, :user_id, :username, :uid, :oauth_token
  validates_presence_of :username, :provider, :user_id, :uid, :oauth_token
  validates_uniqueness_of :username, :uid, :provider, :oauth_token
  belongs_to :user
  scope :has_account, lambda{|provider| where(:provider => provider).first}
  def facebook_post
  	@post = Koala::Facebook::API.new(oauth_token)
  	@post.put_wall_post("hello!")
  end
end