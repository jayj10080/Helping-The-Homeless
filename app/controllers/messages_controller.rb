class MessagesController < ApplicationController
  def index
    @message = Message.new
    @messages = Message.order(:id).all
  end

  def create
    Message.create(message_params.merge({user_id: current_user.id, email: current_user.email}))
    redirect_to messages_path
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
