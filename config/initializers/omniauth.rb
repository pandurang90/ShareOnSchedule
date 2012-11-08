Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, "key", "secret", :scope => 'r_fullprofile r_emailaddress rw_nus r_network', :fields => ["id", "email-address", "first-name", "last-name", "headline", "industry", "picture-url", "public-profile-url", "location", "connections"]
end