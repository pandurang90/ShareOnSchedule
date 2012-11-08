class TweetsController < ApplicationController
  def index
    #@tweets=current_user.tweets
    @tweet=Tweet.new
    @tweets=Tweet.all
  end

  def create
    @tweet=Tweet.new(params[:tweet])
    if @tweet.save
      redirect_to tweets_path
    else
      render "new"
    end
  end

  def show
    @tweet=current_user.tweets.find(params[:id])
  end

  def edit
    @tweet=current_user.tweets.find(params[:id])
  end

  def new
    @tweet=current_user.tweets.new
  end

  def destroy
    @tweet=current_user.tweets.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path
  end
end
