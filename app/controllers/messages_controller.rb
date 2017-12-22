class MessagesController < ApplicationController

  def index
  @group = Group.find(params[:group_id])
  @groups = current_user.groups
  @messages = Message.includes(:user)
  # @messages = current_user.messages.order("created_at DESC")
  # @messages = Messages.find(params[:id])
  end

  def create
    @message = Message.new(message_params)
     if @message.save
     redirect_to group_messages_path
     else
     flash.now[:alert] = "メッセージを入力してください"
     render :index
     end
  # @message  = Message.create(text: message_params[:text,], group_id: message_params[:group_id],image: message_params[:image], user_id: current_user)
  # redirect_to "/groups/#{@message.group_id/messages}"
  end

  def message_params
    params.permit(:text, :image, :group_id).merge(user_id: current_user.id)
  end

  def group_params
    params.permit(:group_name,:user_id)
  end
end
