class LinkedinsController < ApplicationController
#before_filter :authenticate_user!
  def index
    @linkedins = Linkedin.all
    @linkedin = Linkedin.new
  end

  def show
    @linkedin = current_user.linkedins.find(params[:id])
  end

  def new
    @linkedin = current_user.linkedins.new
  end

  def edit
    @linkedin = current_user.linkedins.find(params[:id])
  end

  def create
    @linkedin = Linkedin.new(params[:linkedin])
      if @linkedin.save
        redirect_to linkedins_url
      else
        render "new"
      end
  end

  def update
    current_user.linkedins.find(params[:id])
      if @linkedin.update_attributes(params[:linkedin])
        redirect_to linkedins_url
      else
        render "edit"
      end
  end

  def destroy
    current_user.linkedins.find(params[:id])
      @linkedin.destroy
        redirect_to linkedins_url
  end
  
end