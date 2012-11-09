class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	
	def all
		auth = request.env["omniauth.auth"]
		if(current_user)
			if(Account.find_by_provider_and_uid(auth['provider'], auth['uid']))
				sign_in_and_redirect current_user
			else
				current_user.accounts.create(:username => auth['username'], :uid => auth['uid'], :provider => auth['provider'], :oauth_token => auth['credentials']['token'])
			
				sign_in_and_redirect current_user
			end
		else
<<<<<<< HEAD
			# IF account is found
			if(@account=Account.find_by_provider_and_uid(auth['provider'], auth['uid']))
				#Add set current user is account user
				
			else
				# Find out user is present(may be sign up with devise or already present is system)
				@user =User.find_by_email( auth['info']['email'])
				if @user.present?
					# Then add accounts to user profile
					@account=@user.accounts.create(:username => auth['info']['nickname'],
																				 :uid => auth['uid'],
																				 :provider => auth['provider'],
																				 :oauth_token => auth['credentials']['token'])
				else
					# Create new user and add account to his profile
					@dummy_password = Devise.friendly_token[0,20]
					@user = User.create(:password => @dummy_password,
															:password_confirmation => @dummy_password, 
															:email => @email)

					@user.save!
					@account=@user.accounts.create(:username => auth['info']['nickname'], 
																				 :uid => auth['uid'], 
																				 :provider => auth['provider'], 
																				 :oauth_token => auth['credentials']['token'])
 				end	
				
=======
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
>>>>>>> f9a5770f5e1eb0caa83d54cd8c28472dee4800fc
			end
			current_user=@account.user
			sign_in_and_redirect current_user

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