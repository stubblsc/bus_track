json.array!(@stops) do |stop|
  json.extract! stop, :name, :description, :latitude, :longitude
  json.url stop_url(stop, format: :json)
end
