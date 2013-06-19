require 'redis'
REDIS = Redis.new(host: "redis://localhost", port: 15001)
 
Sidekiq.configure_server do |config|
  config.redis = { url: "redis://localhost:15001" }
end
 
 
Sidekiq.configure_client do |config|
  config.redis = { url: "redis://localhost:15001" }
end