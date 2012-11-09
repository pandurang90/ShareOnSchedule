class LinkedinsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @linkedin = current_user.linkedins.new
    @linkedins = current_user.linkedins
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
    @linkedin = current_user.linkedins.new(params[:linkedin])
    respond_to do |format|
      if @linkedin.save
        format.js{
          render :json => { status: 'success', linkedin: linkedin }
        }
        format.html{ redirect_to linkedins_path}
      else
        format.js {
          render :json => { status: 'error', errors: @linkedin.errors.full_messages.join(', ')}
        }        
        format.html{redirect_to linkedins_path}
      end
    end
  end

  def destroy
    current_user.linkedins.find(params[:id])
      @linkedin.destroy
        redirect_to linkedins_url
  end
  
end