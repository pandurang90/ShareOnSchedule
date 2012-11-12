class Account < ActiveRecord::Base
  
  attr_accessible :provider, :user_id, :username, :uid, :oauth_token, :oauth_token_secret, :oauth_verifier
  
  validates_presence_of :username, :provider, :user_id, :uid, :oauth_token, :oauth_token_secret
  validates_uniqueness_of :username, :uid, :provider, :oauth_token, :oauth_token_secret
  belongs_to :user

  def facebook_post
  	@post = Koala::Facebook::API.new(oauth_token)
  	@post.put_wall_post("hello!")
  end

  def self.has_account(provider)
    where(:provider => provider).first
  end

end