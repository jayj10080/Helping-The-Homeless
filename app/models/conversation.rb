class Conversation < ActiveRecord::Base
  belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'
  has_many :direct_messages, dependent: :destroy
  validates_uniqueness_of :sender_id, :scope => :recipient_id
  # Query database to find a conversation that already exists
  # This is a class level method which is equivalent to the commented out def below.
  # Class level method is a method that can be called on the class itself.
  scope :between, -> (sender_id,recipient_id) do
    # Prevents SQL injection.  Sanitizes code
    where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR
      (conversations.sender_id = ? AND conversations.recipient_id =?)", sender_id,recipient_id, recipient_id, sender_id)
  end

  def unread
    direct_messages.where("user_id = ? AND read = false", recipient_id).count
  end

  # Results of trial and error. Class level method:
  # def self.between(sender_id, recipient_id)
  # end
end
