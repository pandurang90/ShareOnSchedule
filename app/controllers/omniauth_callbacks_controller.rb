class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	
	def all
		auth = request.env["omniauth.auth"]
		if(current_user)
			if(Account.find_by_provider_and_uid(auth['provider'], auth['uid']))
				sign_in_and_redirect current_user
			else
				current_user.accounts.create(:username => auth['username'], :uid => auth['uid'], :provider => auth['provider'])
				sign_in_and_redirect current_user
			end
		else
			if(@account = Account.find_by_provider_and_uid(auth['provider'], auth['uid']))
				current_user = @account.user
				sign_in_and_redirect current_user
			else
				@user = User.create(:password => "asdf123", :password_confirmation => "asdf123", :email => auth['info']['email']) if auth['provider'] == "facebook"
				@user = User.create(:password => "asdf123", :password_confirmation => "asdf123", :email => auth['info']['email']) if auth['provider'] == "twitter"
				@user.save! 
				@account = @user.accounts.create(:username => auth['info']['nickname'], :uid => auth['uid'], :provider => auth['provider'])
				current_user = @account.user
				sign_in_and_redirect current_user
			end
		end
	end

  def linkedin
	 	auth = request.env["omniauth.auth"]
	 	if(current_user)
	 		if(Account.find_by_provider_and_uid(auth['provider'], auth['uid']))
	 			sign_in_and_redirect current_user
	 		else
	 			current_user.accounts.create(:username => auth['username'], :uid => auth['uid'], :provider => auth['provider'])
	 			sign_in_and_redirect current_user
	 		end
	 	else
	 		if(@account = Account.find_by_provider_and_uid(auth['provider'], auth['uid']))
	 			current_user = @account.user
	 			sign_in_and_redirect current_user
	 		else
	 			@user = User.create(:password => "asdf123", :password_confirmation => "asdf123", :email => auth['info']['email'])
	 			@user.save! 
	 			@account = @user.accounts.create(:username => auth['info']['first_name'], :uid => auth['uid'], :provider => auth['provider'])
				current_user = @account.user
	 			sign_in_and_redirect current_user
	 		end
	 	end
	 	#client = LinkedIn::Client.new("3k4b76isgyvi", "vRAIHUmoyd4wDkJl")
	 	#request_token = client.request_token(:oauth_callback => "https://www.linkedin.com/uas/oauth/authorize?omniauth_callbacks")
#https://www.linkedin.com/uas/oauth/authorize?oauth_token=5e548c6e-5726-48b
	 	#pin = params[:oauth_verifier]
	 	#client.authorize_from_request("3k4b76isgyvi","vRAIHUmoyd4wDkJl",pin)
	 	#@profile = client.profile
    #@connections = client.connections
#binding.pry
#response = client.add_share(:comment => 'Hello !')
#puts "#{response}"
#sleep(5.0)
	end

alias_method :twitter, :all # method over-riding
alias_method :facebook, :all # method over-riding

end