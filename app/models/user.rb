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
    time = self.get_time(@tweet.post_time)
    TweetWorker.perform_at(time.seconds.from_now,@account.oauth_token,@account.oauth_token_secret,@tweet.id)
  end

  def schedule_fbpost(post)
    @fb_post=post
    @account = self.accounts.where(:provider => "facebook").first
    time = self.get_time(@tweet.post_time)
    FbPostWorker.perform_at(time.seconds.from_now,@account.oauth_token,@fb_post.id)
  end

  def schedule_linkedin(linkedin)
    @linkedin=linkedin
    @account = self.accounts.where(:provider => "linkedin").first
    time = self.get_time(@tweet.post_time) 
    LinkedinWorker.perform_at(time.seconds.from_now,@account.oauth_token,@account.oauth_token_secret,@account.oauth_verifier,@linkedin.id)
  end

  def get_time(time)
    time_now = Time.parse(Time.now.to_s)
    post_time = Time.parse(time.to_s)
    time = (post_time - (time_now+time_now.utc_offset)) < 0 ? 0 : (post_time - (time_now+time_now.utc_offset))
    time
  end
end