json.array!(@vehicles) do |vehicle|
  json.extract! vehicle, :busId
  json.url vehicle_url(vehicle, format: :json)
end
