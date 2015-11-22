class RelationshipsController < ApplicationController
  before_filter :get_current_relationship

  def get_current_relationship
    @current_relationship = Relationship.find(params[:id])
    @current_user = current_user
  end

  def show
  	if @current_relationship.user_id == current_user.id
  		@current_match = User.find(@current_relationship.ottr_id)
  	else
  		@current_match = User.find(@current_relationship.user_id)
  	end

  	@messages_sent = @current_user.messages.are_from(@current_user).are_to(@current_match)
  	@messages_received = @current_user.messages.are_from(@current_match).are_to(@current_user)
  	@messages = (@messages_sent + @messages_received).reverse
  	@reply = ActsAsMessageable::Message.new

  end

  def create_message

  	if @current_relationship.user_id == current_user.id
  		@current_match = User.find(@current_relationship.ottr_id)
  	else
  		@current_match = User.find(@current_relationship.user_id)
  	end

    @to = @current_match

    @current_user.send_message(@to, params[:reply][:body])
    redirect_to relationships_path
  end

  def set_status
    @current_relationship.user_flag = params[:user_flag]
    @current_relationship.status = false
    @current_relationship.save

    redirect_to root_path
  end
end
