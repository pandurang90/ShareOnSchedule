require 'rubygems'
require 'linkedin'

class LinkedinMe
  
  attr_accessor :token, :secret, :verifier
  
  def initialize(token,secret,verifier)
    @token = token
    @secret = secret
    @verifier = verifier
  end

  def share(text="")
    user = LinkedIn::Client.new('3k4b76isgyvi', 'vRAIHUmoyd4wDkJl')
    user.authorize_from_access(@token, @secret)
    user.add_share(:comment => text)  
  end
end