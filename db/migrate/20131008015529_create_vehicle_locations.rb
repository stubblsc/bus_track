class CreateVehicleLocations < ActiveRecord::Migration
  def change
    create_table :vehicle_locations do |t|
      t.integer :vehicleId
      t.integer :routeId
      t.decimal :latitude, :precision => 10, :scale => 6 
      t.decimal :longitude, :precision => 10, :scale => 6

      t.timestamps
    end
  end
end
