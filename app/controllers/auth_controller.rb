require 'rubygems'
require 'linkedin'
require 'oauth'

class AuthController < ApplicationController  
  def create
    render :text => request.env["omniauth.auth"].to_yaml
  end
  
  def callback 
    request.env["omniauth.auth"]["credential"]
    client = LinkedIn::Client.new("key", "secret")
    client.authorize_from_access(request.env["omniauth.auth"]["credentials"]["token"], request.env["omniauth.auth"]["credentials"]["secret"])    
    @profile = client.profile(:fields => [:first_name]).first_name
    @profiles = client.profile(:fields => [:last_name]).last_name  
    @headline = client.profile(:fields => [:headline]).headline
    @share = client.add_share(:comment => "Testing, 1, 2, 3")
  end
end