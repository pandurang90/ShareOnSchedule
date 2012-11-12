class User < ActiveRecord::Base
	
	devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
         
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  
  has_many :accounts
  has_many :tweets
  has_many :linkedins

  # Setup accessible (or protected) attributes for your model
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
end