class NotificationMailer < ApplicationMailer
  default from: "no-reply@Helping-The-Homeless.com"

  def new_message
    mail(to: "jjcoder1000@gmail.com",
      subject: "You have received a new message.")
  end
end
