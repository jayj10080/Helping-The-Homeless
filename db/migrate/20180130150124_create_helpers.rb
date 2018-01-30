class CreateHelpers < ActiveRecord::Migration[5.0]
  def change
    create_table :helpers do |t|
      t.string :name
      t.text :about
      t.text :how
      t.integer :user_id
      t.timestamps
    end
  add_index :helpers, :user_id
  end
end
