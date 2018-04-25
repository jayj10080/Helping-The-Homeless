class User < ActiveRecord::Base
  has_one :helpee
  has_one :helper
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :conversations_as_sender, :foreign_key => :sender_id, class_name: 'Conversation'
  has_many :conversations_as_recipient, :foreign_key => :recipient_id, class_name: 'Conversation'
  has_many :messages

  def all_unread_direct_messages
    DirectMessage.where(recipient_id: self.id, read: false).count
  end

  def all_unread_conversation_messages(convo)
    DirectMessage.where(recipient_id: self.id, read: false, conversation_id: convo.id).count
  end
end

