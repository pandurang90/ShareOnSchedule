class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	
	def all
		auth = request.env["omniauth.auth"]
		binding.pry
		if(current_user)
			binding.pry
			if(Account.find_by_provider_and_uid(auth['provider'], auth['uid']))
				sign_in_and_redirect current_user
			else
				current_user.accounts.create(:username => auth['info']['nickname'], 
																		 :uid => auth['uid'], 
																		 :provider => auth['provider'], 
																		 :oauth_token => auth['credentials']['token'],
																		 :oauth_secret => auth['credentials']['secret'])
			
				sign_in_and_redirect current_user
			end
		else
			# IF account is found
			if(@account=Account.find_by_provider_and_uid(auth['provider'], auth['uid']))
				#Add set current user is account user
				
			else
				# Find out user is present(may be sign up with devise or already present is system)
				@user =User.find_by_email(auth['info']['email'])
				if @user.present?
					# Then add accounts to user profile
					@account=@user.accounts.create(:username => auth['info']['nickname'],
																				 :uid => auth['uid'],
																				 :provider => auth['provider'],
																				 :oauth_token => auth['credentials']['token'],
																				 :oauth_secret => auth['credentials']['secret'])
				else
					# Create new user and add account to his profile
					@dummy_password = Devise.friendly_token[0,14]
					@user = User.create(:password => @dummy_password,
															:password_confirmation => @dummy_password, 
															:email => auth['info']['email'])
					@user.save!
					@account=@user.accounts.create(:username => auth['info']['nickname'], 
																				 :uid => auth['uid'], 
																				 :provider => auth['provider'], 
																				 :oauth_token => auth['credentials']['token'],
																				 :oauth_secret => auth['credentials']['secret'])
 				end	
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
	end

alias_method :twitter, :all # method over-riding
alias_method :facebook, :all # method over-riding

end