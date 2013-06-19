class WelcomeController < ApplicationController
  
  layout "welcome"
  
  def index
    redirect_to home_path if current_user.present?
  end
  
  def about_us
  end

end