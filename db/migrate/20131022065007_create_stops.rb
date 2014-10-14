class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.string :name
      t.text :description, :limit =>16384
      t.integer :route_id
      t.decimal :latitude, :precision => 10, :scale => 6 
      t.decimal :longitude, :precision => 10, :scale => 6 

      t.timestamps
    end
  end
end
