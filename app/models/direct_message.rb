class DirectMessage < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user
  validates_presence_of :body, :conversation_id, :user_id
  after_create :send_message_email
 
  def message_time
    created_at.strftime("%m/%e/%y %l:%M %p ")
  end

  def send_message_email
    NotificationMailer.new_message(self).deliver_now
  end

end