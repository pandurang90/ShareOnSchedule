class TweetsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @tweet = current_user.tweets.new
    @tweets = current_user.tweets 
  end

  def show
    @tweet = current_user.tweets.find(params[:id])
  end
  
  def new
    @tweet = current_user.tweets.new
  end

  def edit
    @tweet = current_user.tweets.find(params[:id])
  end

  def create
    @tweet = current_user.tweets.new(params[:tweet])
    respond_to do |format|
      if @tweet.save
        format.js{
          render :json => { status: 'success', tweet: tweet }
        }
        format.html{ redirect_to tweets_path}
      else
        format.js {
          render :json => { status: 'error', errors: @tweet.errors.full_messages.join(', ')}
        }        
        format.html{redirect_to tweets_path}
      end
    end
  end

  def destroy
    @tweet = current_user.tweets.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path
  end

end