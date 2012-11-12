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
        linkedin_provider = current_user.accounts.find_by_provider('linkedin')
        token = linkedin_provider.oauth_token
        secret = linkedin_provider.oauth_token_secret
        verifier = linkedin_provider.oauth_verifier
        LinkedinWorker.perform_at(token,secret,verifier,@linkedin.share)
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
        linkedin_provider = current_user.accounts.find_by_provider('linkedin')
        token = linkedin_provider.oauth_token
        secret = linkedin_provider.oauth_token_secret
        verifier = linkedin_provider.oauth_verifier
        LinkedinWorker.perform(token,secret,verifier,@linkedin.share)
        format.js{}
        format.html{ redirect_to linkedins_path}
      else
        format.js{}        
        format.html{redirect_to linkedins_path}
      end
    end
  end
end