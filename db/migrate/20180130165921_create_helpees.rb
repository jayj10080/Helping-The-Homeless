class CreateHelpees < ActiveRecord::Migration[5.0]
  def change
    create_table :helpees do |t|
      t.string :name
      t.text :about
      t.text :story
      t.text :need
      t.integer :user_id
      t.timestamps
    end
    add_index :helpees, :user_id
  end
end
