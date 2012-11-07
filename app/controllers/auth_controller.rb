require 'rubygems'
require 'linkedin'
class AuthController < ApplicationController
  def index
    # get your api keys at https://www.linkedin.com/secure/developer
    client = LinkedIn::Client.new("Your_API_KEY", "Your_SECRET")
    request_token = client.request_token(:oauth_callback => 
                                  "http://#{request.host_with_port}/auth/callback")
    session[:rtoken] = request_token.token # request token
    session[:rsecret] = request_token.secret # request secret
    redirect_to client.request_token.authorize_url
  end

  def callback
    client = LinkedIn::Client.new("Your_API_KEY", "Your_SECRET")
    if session[:atoken].nil?
      pin = params[:oauth_verifier]
      atoken, asecret = client.authorize_from_request(session[:rtoken], session[:rsecret], pin)
      session[:atoken] = atoken # authentication token
      session[:asecret] = asecret # authentication secret
    else
      client.authorize_from_access(session[:atoken], session[:asecret])
    end
    @profile = client.profile(:fields => [:first_name]).first_name
    @profiles = client.profile(:fields => [:last_name]).last_name  
  end
end