class RegistrationsController < Devise::RegistrationsController
	def new
		build_resource({})
		self.resource.profile = Profile.new
		respond_with self.resource
	end

	def create
		super
	end

	def update
		
	end

	private

	def sign_up_params
		allow = [:email, :username, :password, :password_confirmation, :image, profile_attributes: [:first_name, :last_name, :bio, :gender, :looking_for, :birthday]]
		params.require(resource_name).permit(allow)
	end

	def account_update_params
		allow = [:email, :username, :password, :password_confirmation, :image, profile_attributes: [:first_name, :last_name, :bio, :gender, :looking_for, :birthday]]
		params.require(resource_name).permit(allow)
	end

	def user_params
		allow = [:email, :username, :password, :password_confirmation, :image, profile_attributes: [:first_name, :last_name, :bio, :gender, :looking_for, :birthday]]
		params.require(:user).permit(allow)
	end
end