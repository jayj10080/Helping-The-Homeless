class AlterHelpeesAddAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :helpees, :address, :string
  end
end
