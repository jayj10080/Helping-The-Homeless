class ConversationsController < ApplicationController
  before_action :authenticate_user!
  after_filter :destroy_conversation

  def index
    if current_user.helpee.present? || current_user.helper.present?
      @users = User.all
      @conversations = Conversation.all
    else
      return render plain: 'You need to create a profile first.', status: :forbidden
    end
  end

  def update
    @conversation = Conversation.find(params[:id])
    @conversation.direct_messages.update_all(read: true)
  end

  def create
    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_direct_messages_path(@conversation)
  end

  def destroy
    @conversation = Conversation.find(params[:id])
    @conversation.destroy
    redirect_to conversations_path
  end

  private

  def destroy_conversation
    @conversations = Conversation.all
  end

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
