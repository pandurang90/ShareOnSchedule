require 'redis'
if Rails.env=="development"
  host="redis://localhost"
  REDIS = Redis.new(host: host, port: 15001)
elsif Rails.env == "production"
  host = "127.3.199.129"
  REDIS = Redis.new(host: host , port: 15001)
end  


 
Sidekiq.configure_server do |config|
  config.redis = { url: host+":15001" }
end
 
 
Sidekiq.configure_client do |config|
  config.redis = { url: host+":15001" }
end