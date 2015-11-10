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
		binding.pry
		if @current_user.update(user_params)
			flash[:alert] = "Your settings were updated successfully."
			redirect_to root_path
		else
			flash[:alert] = "Your settings were not updated successfully."
			redirect_to root_path
		end
	end


	private

	def user_params
		allow = [:email, :username, :password, :password_confirmation, profile_attributes: [:first_name, :last_name, :bio, :gender, :looking_for, :birthday], photo_attributes: [:image1, :image2, :image3]]
		params.require(:user).permit(allow)
	end
end
