class MessagesController < ApplicationController
  before_action :authenticate_user!
  after_filter :destroy_message

  def index
    if current_user.helpee.present? || current_user.helper.present?
      @message = Message.new
      @messages = Message.includes(:user).order(:id).all
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

  def destroy
  end

  private

  def destroy_message
    @messages = Message.order(:id).all
    if @messages.length > 12
      @messages[0].destroy
    end
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
