class AddNotificationsToHelper < ActiveRecord::Migration[5.0]
  def change
    add_column :helpers, :notifications, :boolean, :default => false
  end
end
