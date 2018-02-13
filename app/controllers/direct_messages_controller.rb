class DirectMessagesController < ApplicationController
  before_action do
   @conversation = Conversation.find(params[:conversation_id])
  end
def index
 @messages = @conversation.direct_messages
  if @messages.length > 10
   @over_ten = true
   @messages = @messages[-10..-1]
  end
  if params[:m]
   @over_ten = false
   @messages = @conversation.direct_messages
  end
 if @messages.last
  if @messages.last.user_id != current_user.id
   @messages.last.read = true
   # @messages.last.update_attributes(read: true)
  end
 end
@message = @conversation.direct_messages.new
 end
def new
 @message = @conversation.direct_messages.new
end
def create
 @message = @conversation.direct_messages.new(message_params)
 if @message.save
  redirect_to conversation_direct_messages_path(@conversation)
 end
end
private
 def message_params
  params.require(:direct_message).permit(:body, :user_id)
 end
end
