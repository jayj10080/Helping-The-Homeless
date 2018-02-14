class User < ApplicationRecord
  has_one :helpee
  has_one :helper
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :conversations_as_sender, :foreign_key => :sender_id, class_name: 'Conversation'
  has_many :conversations_as_recipient, :foreign_key => :recipient_id, class_name: 'Conversation'

  def unread_direct_messages
    sum = 0
    conversations_as_recipient.each do |conversation|
      sum += conversation.unread
    end
    conversations_as_sender.each do |conversation|
      sum += conversation.unread
    end
    sum
  end
end
