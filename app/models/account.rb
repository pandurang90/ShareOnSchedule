class Account < ActiveRecord::Base
  attr_accessible :provider, :user_id, :username, :uid
  validates_presence_of :username, :provider, :user_id, :uid
  validates_uniqueness_of :username, :uid, :provider
  belongs_to :user
  scope :has_account, lambda{|provider| where(:provider => provider).first}
end