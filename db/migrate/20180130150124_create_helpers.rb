class CreateHelpers < ActiveRecord::Migration[5.0]
  def change
    create_table :helpers do |t|
      t.string :name
      t.text :about
      t.text :story
      t.text :ineed
      t.integer :user_id
      t.timestamps
    end
  add_index :helpers, :user_id
  end
end
