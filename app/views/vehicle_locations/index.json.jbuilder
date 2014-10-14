json.array!(@vehicle_locations) do |vehicle_location|
  json.extract! vehicle_location, :vehicleId, :routeId, :latitude, :longitude
  json.url vehicle_location_url(vehicle_location, format: :json)
end
