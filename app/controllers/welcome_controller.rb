class WelcomeController < ApplicationController
  
  layout "welcome"
  
  def index
  	binding.pry
  	puts "Index"
  end
  
  def about_us
  end

end