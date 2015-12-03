class Api::V1::UsersController < ApplicationController
	respond to :json

	def show
		respond_with User.find(params[:id])
	end

	def create
		user = User.new(user_params)
		if user.save
			render json: user, status: 201, location: [:api, user]
		else
			render json: { errors: user.errors }, status: 422
		end
	end

	def update
		user = User.find(params[:id])

		if user.update(user_params)
			render json: user, status: 200, location: [:api, user]
		else
			render json: { errors: user.errors }, status: 422
		end
	end

	def destroy
		user = User.find(params[:id])
		user.destroy
		head 204
	end

	private

	def user_params
		allow = [:email, :username, :image, :password, :password_confirmation, profile_attributes: [:id, :first_name, :last_name, :bio, :gender, :looking_for, :birthday]]
		params.require(:user).permit(allow)

		
	end
end