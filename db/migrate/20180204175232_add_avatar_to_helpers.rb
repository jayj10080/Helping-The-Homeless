class AddAvatarToHelpers < ActiveRecord::Migration[5.0]
  def change
    add_column :helpers, :avatar, :string
  end
end
