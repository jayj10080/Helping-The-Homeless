class DirectMessage < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user
  validates_presence_of :body, :conversation_id, :user_id
  after_create :send_message_email
  after_create :send_to_firebase2
 
  def message_time
    created_at.strftime("%m/%e/%y %l:%M %p ")
  end

  def send_message_email
    NotificationMailer.new_message(self).deliver_now
  end

  def send_to_firebase2
    FIREBASE.push("directmessage", { :id => self.id, :body => self.body, :'.priority' => 1, :timestamp => self.created_at })
  end

end