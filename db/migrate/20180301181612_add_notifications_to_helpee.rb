class AddNotificationsToHelpee < ActiveRecord::Migration[5.0]
  def change
    add_column :helpees, :notifications, :boolean, :default => false
  end
end
