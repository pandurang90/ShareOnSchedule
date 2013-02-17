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

  def save_tweet(params)
    @tweet=self.tweets.new(params)
    @tweet.save
    schedule_tweet(@tweet)
  end

  def save_lpost(params)
    @linkedin=self.linkedins.new(params)
    @linkedin.save
    schedule_linkedin(@linkedin)
  end

  def save_fb_post(params)
    @fb_post=self.fb_posts.new(params)
    @fb_post.save
    schedule_fbpost(@fb_post)
  end

  def schedule_tweet(tweet)
    @tweet=tweet
    @account = self.accounts.where(:provider => "twitter").first
    time = @tweet.post_time-Time.now 
    TweetWorker.perform_at(time.seconds.from_now,@account.oauth_token,@account.oauth_token_secret,@tweet.id)
  end

  def schedule_fbpost(post)
    @fb_post=post
    @account = self.accounts.where(:provider => "facebook").first
    time = @fb_post.post_time-Time.now 
    FbPostWorker.perform_at(time.seconds.from_now,@account.oauth_token,@fb_post.id)
  end

  def schedule_linkedin(linkedin)
    @linkedin=linkedin
    @account = self.accounts.where(:provider => "linkedin").first
    time = @linkedin.post_time-Time.now 
    LinkedinWorker.perform_at(time.seconds.from_now,@account.oauth_token,@account.oauth_token_secret,@account.oauth_verifier,@linkedin.id)
  end
end