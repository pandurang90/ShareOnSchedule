class TweetsController < ApplicationController
  #before_filter :authenticate_user!
  def index
    @tweets=current_user.tweets
    @tweet=current_user.tweets.new
  end

  def create
    @tweet=current_user.tweets.new(params[:tweet])
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
