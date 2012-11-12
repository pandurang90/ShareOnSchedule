class TweetsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @tweets = current_user.tweets
  end

  def create
    @tweet = current_user.tweets.new(params[:tweet])
    respond_to do |format|
      if @tweet.save
        #TweetWorker.perform_at(@tweet.tweet_time,current_user.token,current_user.secret,@tweet.content)
        format.js{}
        format.html{ redirect_to tweets_path}
      else
        format.js{}        
        format.html{redirect_to tweets_path}
      end
    end
  end

  def show
    @tweet = current_user.tweets.find(params[:id])
    #TweetMe.publish
  end

  def new
    @tweet = current_user.tweets.new
  end

  def destroy
    @tweet = current_user.tweets.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path
  end

  def update
    @tweet = current_user.tweets.find(params[:id])
    respond_to do |format|
      if @tweet.update_attributes(params[:tweet])
        #TweetWorker.perform_at(@tweet.tweet_time,current_user.token,current_user.secret,@tweet.content)
        format.js{}
        format.html{ redirect_to tweets_path}
      else
        format.js{}        
        format.html{redirect_to tweets_path}
      end
    end
  end
end