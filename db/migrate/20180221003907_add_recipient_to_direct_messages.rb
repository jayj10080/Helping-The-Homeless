class AddRecipientToDirectMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :direct_messages, :recipient_id, :integer
    add_column :direct_messages, :sender_id, :integer
  end
end
