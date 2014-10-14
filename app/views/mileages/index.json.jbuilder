json.array!(@mileages) do |mileage|
  json.extract! mileage, :busId, :driverId, :reason, :startMileage, :endMileage
  json.url mileage_url(mileage, format: :json)
end
