class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :has_twitter?, :has_facebook?, :has_linkedin?

  def has_twitter?
    current_user.accounts.has_account("twitter").present? if current_user.present?
  end

  def has_facebook?
    current_user.accounts.has_account("facebook").present? if current_user.present?
  end

  def has_linkedin?
    current_user.accounts.has_account("linkedin").present? if current_user.present?
  end
   
  def get_name(auth)
    auth['info']['nickname'] || auth['info']['name'] || auth['info']['username']
  end 

  def get_devise_token
    Devise.friendly_token[0,14]
  end


end