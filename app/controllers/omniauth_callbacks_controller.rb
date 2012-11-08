class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def facebook
		auth = request.env["omniauth.auth"]
		if(current_user)
			if(Account.find_by_provider_and_uid(auth['provider'], auth['uid']))
				sign_in_and_redirect current_user
			else
				current_user.accounts.create(:username => auth['username'], :uid => auth['uid'], :provider => auth['provider'])
				sign_in_and_redirect current_user
			end

		else
			binding.pry
			if(@account=Account.find_by_provider_and_uid(auth['provider'], auth['uid']))
				current_user=@account.user
				sign_in_and_redirect current_user
			else
				@user = User.create(:password => "asdf123", :password_confirmation => "asdf123", :email => auth['info']['email'])
				@user.save! 
				binding.pry
				@account=@user.accounts.create(:username => auth['info']['nickname'], :uid => auth['uid'], :provider => auth['provider'])
				current_user=@account.user
				sign_in_and_redirect current_user
			end
		end
	end
end

