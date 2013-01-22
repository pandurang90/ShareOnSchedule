class HomeController < ApplicationController
  #before_filter :require_user
layout 'welcome'
  def index
    #@tweets=current_user.tweets
    #@fbposts=current_user.fb_posts
    #@posts=current_user.linkedins
  end 
end
