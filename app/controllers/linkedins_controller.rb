require 'rubygems'
require 'linkedin'

class LinkedinsController < ApplicationController

  before_filter :authenticate_user!
  
  def index
    @linkedins = current_user.linkedins
  end

  def create
    @linkedin = current_user.linkedins.new(params[:linkedin])
    respond_to do |format|
      if @linkedin.save
        current_user.save_tweet(params[:twitter]) if params[:twitter]=='1'
        current_user.save_fbpost(params[:facebook]) if params[:facebook]=='1'
        current_user.schedule_linkedin(@linkedin)
        format.js{}
        format.html{ redirect_to linkedins_path }
      else
        format.js{}     
        format.html{redirect_to linkedins_path }
      end
    end
  end

  def show
    @linkedin = current_user.linkedins.find(params[:id])
    LinkedinMe.share
  end

  def new
    @linkedin = current_user.linkedins.new
  end

  def edit
    @linkedin = current_user.linkedins.find(params[:id])
  end

  def destroy
    @linkedin = current_user.linkedins.find(params[:id])
    @linkedin.destroy
    redirect_to linkedins_path
  end

   def update
    @linkedin = current_user.linkedins.find(params[:id])
    respond_to do |format|
      if @linkedin.update_attributes(params[:linkedin])
        @account = current_user.accounts.where(:provider => "linkedin").first
        time = Linkedin.where(:id => @linkedin.id).select("TIME_TO_SEC(TIME_TO_SEC(post_time)-TIME_TO_SEC(NOW())) as second").first.second
        LinkedinWorker.perform_at(time.seconds.from_now,@account.oauth_token,@account.oauth_token_secret,@account.oauth_verifier,@linkedin.share)
        format.js{}
        format.html{ redirect_to linkedins_path}
      else
        format.js{}        
        format.html{redirect_to linkedins_path}
      end
    end
  end
end