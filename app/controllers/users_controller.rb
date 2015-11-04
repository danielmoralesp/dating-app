class UsersController < ApplicationController

	def user_params
		allow = [:email, :username, :password, :password_confirmation, profile_attributes: [:first_name, :last_name, :bio, :gender, :looking_for, :birthday]]
		params.require(:user).permit(allow)
	end
end
