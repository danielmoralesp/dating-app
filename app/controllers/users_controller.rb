class UsersController < ApplicationController
	def index
		@current_user = User.find(current_user.id)
		@current_profile = Profile.where(user_id: current_user.id).first
	end

	def edit
		@current_user = User.find(current_user.id)
		@current_profile = Profile.where(user_id: current_user.id).first
	end

	def update
		@current_user = User.find(current_user)
		if @current_user.update(user_params)
			flash[:alert] = "Your settings were updated successfully."
			redirect_to root_path
		else
			flash[:alert] = "Your settings were not updated successfully."
			redirect_to root_path
		end
	end

	def edit_profile
		@current_user = User.find(current_user)
		@current_profile = Profile.where(user_id: current_user).first
	end

	def update_profile
		@current_user = User.find(current_user.id)
		if @current_user.update(user_params)
			flash[:alert] = "Your settings were updated successfully."
			redirect_to user_path @current_user
		else
			flash[:alert] = "Your settings were not updated successfully."
			binding.pry
			redirect_to root_path
		end
	end


	private

	def user_params
		allow = [:email, :username, :image, :password, :password_confirmation, profile_attributes: [:first_name, :last_name, :bio, :gender, :looking_for, :birthday]]
		params.require(:user).permit(allow)

		
	end
end
