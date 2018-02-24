class MessagesController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.helpee.present? || current_user.helper.present?
      @message = Message.new
      @messages = Message.order(:id).all
    else 
      return render plain: 'You need to create a profile first.', status: :forbidden
    end
  end

  def create
    if current_user.helpee.present? || current_user.helper.present?
      Message.create(message_params.merge({user_id: current_user.id, email: current_user.email}))
      redirect_to messages_path
    else
      return render plain: 'You need to create a profile first.', status: :forbidden
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
