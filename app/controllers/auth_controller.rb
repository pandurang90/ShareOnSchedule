require 'rubygems'
require 'linkedin'
require 'oauth'

class AuthController < ApplicationController
  
  def index
    render :text => request.env["omniauth.auth"].to_yaml
  end
  
  def create
    render :text => request.env["omniauth.auth"].to_yaml
  end
  
  def callback 
    request.env["omniauth.auth"]["credential"]
    client = LinkedIn::Client.new("3k4b76isgyvi", "vRAIHUmoyd4wDkJl")
    client.authorize_from_access(request.env["omniauth.auth"]["credentials"]["token"], request.env["omniauth.auth"]["credentials"]["secret"])    
    @profile = client.profile(:fields => [:first_name]).first_name
    @profiles = client.profile(:fields => [:last_name]).last_name  
    #@educations = client.profile(:fields => [:educations]).educations
    @headline = client.profile(:fields => [:headline]).headline
    #@status = client.update_status('This is my new status')
    @share = client.add_share(:comment => "Testing, 1, 2, 3")
  end
end