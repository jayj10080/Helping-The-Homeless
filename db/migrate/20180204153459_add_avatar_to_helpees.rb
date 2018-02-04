class AddAvatarToHelpees < ActiveRecord::Migration[5.0]
  def change
    add_column :helpees, :avatar, :string
  end
end
