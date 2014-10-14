json.array!(@drivers) do |driver|
  json.extract! driver, :name, :currentBusID, :currentRouteID
  json.url driver_url(driver, format: :json)
end
