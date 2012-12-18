class FbPostsController < ApplicationController
    before_filter :authenticate_user!

  def index
    @fb_posts = current_user.fb_posts
  end

  def create
    @fb_post = current_user.fb_posts.new(params[:fb_post])
    respond_to do |format|
      if @fb_post.save
        @account = current_user.accounts.where(:provider => "facebook").first
        #time = Tweet.where(:id => @tweet.id).select("TIME_TO_SEC(TIME_TO_SEC(tweet_time)-TIME_TO_SEC(NOW())) as second").first.second
        #TweetWorker.perform_at(time.seconds.from_now,@account.oauth_token,@account.oauth_token_secret,@tweet.id)
        format.js{}
        format.html{ redirect_to fb_posts_path }
      else
        format.js{}        
        format.html{redirect_to fb_posts_path }
      end
    end
  end

  def show
    @fb_post = current_user.fb_posts.find(params[:id])
  end

  def new
    @fb_post = current_user.fb_posts.new
  end

  def destroy
    @fb_post = current_user.fb_posts.find(params[:id])
    @fb_post.destroy
    redirect_to fb_posts_path
  end

  def update
    @fb_post = current_user.fb_posts.find(params[:id])
    respond_to do |format|
      if @fb_post.update_attributes(params[:fb_post])
        #TweetWorker.perform_at(@tweet.tweet_time,current_user.token,current_user.secret,@tweet.content)
        format.js{}
        format.html{ redirect_to fb_posts_path}
      else
        format.js{}        
        format.html{redirect_to fb_posts_path}
      end
    end
  end

end
