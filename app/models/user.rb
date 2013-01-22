class User < ActiveRecord::Base
	
	devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
         
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
   validates :username, :presence=> true
  has_many :accounts
  has_many :tweets
  has_many :linkedins
  has_many :fb_posts

  def email_required?
    false
  end

  # Setup accessible (or protected) attributes for your model
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
end