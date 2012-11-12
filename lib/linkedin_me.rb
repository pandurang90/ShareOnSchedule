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
    client = LinkedIn::Client.new('3k4b76isgyvi', 'vRAIHUmoyd4wDkJl')
    client.authorize_from_access(@token, @secret)
    client.add_share(:comment => text)  
  end
end