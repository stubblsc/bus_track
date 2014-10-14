class RenameFieldsInVehicleLocations < ActiveRecord::Migration
  def up
    rename_column :vehicle_locations, :vehicleId, :vehicle_id
    rename_column :vehicle_locations, :routeId, :route_id
  end
end
