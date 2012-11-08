class Account < ActiveRecord::Base
  attr_accessible :provider, :user_id, :username, :uid
  validates_presence_of :username, :provider, :user_id, :uid
  validates_uniqueness_of :username, :uid, :provider
  belongs_to :user


	def self.find_from_omniauth(hash)
	  find_by_provider_and_uid(hash['provider'], hash['uid'])
	end

	def self.create_from_omniauth(hash, user = nil)
	  user ||= User.create_from_hash!(hash)
	  Account.create(:user => user, :uid => hash['uid'], :provider => hash['provider'])
	end

	def self.new_with_session(params,session)
	  if session["devise.user_attributes"]
	    new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
	    end
	  else
	    super
	  end
	end
end
