class NotificationMailer < ApplicationMailer
  default from: "no-reply@Helping-The-Homeless.com"

  def new_message(message)
    @conversation = message.conversation
    @person = @conversation.recipient_id
    @user = User.find(@person)
    # if @user.helpee.present?
    #   if @user.helpee.notifications == true  
        mail(to: @user.email, subject: "You have received a new message.")
    #   end
    # end
    # if @user.helper.present?
    #   if @user.helper.notifications == true  
    #     mail(to: @user.email, subject: "You have received a new message.")
    #   end
    # end
  end
end
