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
			if(@account=Account.find_by_provider_and_uid(auth['provider'], auth['uid']))
				current_user=@account.user
				sign_in_and_redirect current_user
			else
				@user = User.create(:password => "asdf123", :password_confirmation => "asdf123", :email => auth['info']['email'])
				@user.save! 
				@account=@user.accounts.create(:username => auth['info']['nickname'], :uid => auth['uid'], :provider => auth['provider'])
				current_user=@account.user
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
			if(@account=Account.find_by_provider_and_uid(auth['provider'], auth['uid']))
				current_user=@account.user
				sign_in_and_redirect current_user
			else
				@user = User.create(:password => "asdf123", :password_confirmation => "asdf123", :email => auth['info']['email'])
				@user.save! 
				@account=@user.accounts.create(:username => auth['info']['first_name'], :uid => auth['uid'], :provider => auth['provider'])
				current_user=@account.user
				sign_in_and_redirect current_user
			end
		end
	end

alias_method :twitter, :all
alias_method :facebook, :all

end