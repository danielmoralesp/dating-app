class ProfilesController < ApplicationController
	def show
		@current_user = User.find(current_user.id)
		@current_profile = Profile.where(user_id: current_user.id).first
	end

	def edit
		@current_user = User.find(current_user.id)
		@current_profile = Profile.where(user_id: current_user.id).first
	end

	def update
		@current_user = User.find(current_user.id)
		@current_profile = Profile.where(user_id: current_user.id).first
		if @current_profile.update(profile_params) && @current_user.update(user_params)
			flash[:alert] = "Your settings were updated successfully."
			redirect_to profile_path(@current_user)
		else
			flash[:alert] = "Your settings were not updated successfully."
			render 'edit'
		end
	end

	private

	def profile_params
		allow = [:first_name, :last_name, :bio, :gender, :looking_for, :birthday, user_attributes: [:id, :image]]
		profile_params = params.require(:profile).permit(allow)

		# profile_params.user.delete(:password) unless profile_params.user[:password].present?
		# profile_params.user.delete(:password_confirmation) unless profile_params.user[:password_confirmation].present?

		return profile_params

	end

	def user_params
		allow = [:email, :username, :image, :password, :password_confirmation, profile_attributes: [:first_name, :last_name, :bio, :gender, :looking_for, :birthday]]
		params.require(:user).permit(allow)
	end
end
