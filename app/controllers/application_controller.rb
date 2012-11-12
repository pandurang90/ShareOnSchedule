class ApplicationController < ActionController::Base
  protect_from_forgery
  #before_filter :check_email

  def check_email
    if current_user != nil
      unless !current_user.email.blank? 
        redirect_to root_path
      end
    end
  end
end