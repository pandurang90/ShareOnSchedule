class User < ActiveRecord::Base
	devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable,
         :token_authenticatable, :confirmable,
  			 :lockable
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  has_many :accounts
end