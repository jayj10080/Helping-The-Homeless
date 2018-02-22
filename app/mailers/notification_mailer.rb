class NotificationMailer < ApplicationMailer
  default from: "no-reply@Helping-The-Homeless.com"

  def new_message(message)
    @conversation = message.conversation
    @person = @conversation.recipient_id
    @user = User.find(@person)
    mail(to: @user.email,
      subject: "You have received a new message.  Go to inbox ")
  end
end
