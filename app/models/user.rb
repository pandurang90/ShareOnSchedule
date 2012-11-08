class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  # attr_accessible :title, :body
  has_many :accounts
=begin
  def User.accounts.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      #user.provider = auth.provider
      #user.uid = auth.uid
      #user.username = auth.info.nickname
      #user.save!
    end 
  end
=end

  def self.from_omniauth(hash)
    create(:name => hash['user_info']['name'])
  end
  
=begin
  def password_required?
    super && provider.blank?
  end
=end
end