class AlterHelpeesAddLatAndLng < ActiveRecord::Migration[5.0]
  def change
    add_column :helpees, :latitude, :float
    add_column :helpees, :longitude, :float
  end
end
