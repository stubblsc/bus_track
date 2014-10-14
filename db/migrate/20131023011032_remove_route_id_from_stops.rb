class RemoveRouteIdFromStops < ActiveRecord::Migration
  def change
    remove_column :stops, :route_id, :integer
  end
end
