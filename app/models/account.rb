class Account < ActiveRecord::Base

  attr_accessible :provider, :user_id, :username, :uid, :oauth_token, :oauth_token_secret, :oauth_verifier
  
  validates_presence_of :username, :provider, :user_id, :uid, :oauth_token
  validates_uniqueness_of :username, :uid, :provider, :oauth_token, :oauth_token_secret
  validates_presence_of :oauth_token_secret, :unless => :checking_provider?
  
  belongs_to :user

  def checking_provider?
  	provider == 'facebook' || provider == 'linkedin'
  end

  def self.has_account(provider)
    where(:provider => provider).first
  end

end