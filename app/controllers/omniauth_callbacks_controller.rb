class OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def all
		auth = request.env["omniauth.auth"]

		@account=Account.find_by_provider_and_uid(auth['provider'], auth['uid'])
		#if account is present
		#binding.pry
		if @account	
			if check_user
				update_oauth_params(auth,@account)
				redirect_to root_path
			else
				update_oauth_params(auth,@account)
				sign_in_and_redirect @account.user		
			end
			#update_oauth_params(auth,@account)
		else
			# IF account not found
			if check_user
				create_account(check_user,auth)
			else
				@name=get_name(auth)
				@dummy_password = get_devise_token
				@user=User.create(:username=>@name,:password=> @dummy_password,:password_confirmation=>@dummy_password)
				create_account(@user,auth)
			end
		end

	end


# method over-riding
alias_method :twitter, :all 
alias_method :facebook, :all 
alias_method :linkedin, :all


  def check_user
  	current_user
  end

	def create_account(user,auth)
		@name = auth['info']['nickname'] || auth['info']['name'] || auth['info']['username']
		@verifier = params['oauth_verifier'] || get_devise_token
		@secret = auth['credentials']['secret'] || get_devise_token
		@account = user.accounts.create(:username => @name, 
																		 :uid => auth['uid'], 
																		 :provider => auth['provider'], 
																		 :oauth_token => auth['credentials']['token'],
																		 :oauth_token_secret => @secret,
																		 :oauth_verifier => @verifier)
		if check_user 
			redirect_to root_path 
		else
			sign_in_and_redirect user 
		end

	end

	def update_oauth_params(auth,account)
		@verifier=params['oauth_verifier'] || get_devise_token
		@secret=auth['credentials']['secret'] || get_devise_token
		account.update_attributes(:oauth_token=> auth['credentials']['token'],
															:oauth_token_secret=> @secret,
															:oauth_verifier=>@verifier)
	end

end