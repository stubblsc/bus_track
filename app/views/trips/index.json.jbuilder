json.array!(@trips) do |trip|
  json.extract! trip, :route_id, :order, :first_stop_id, :second_stop_id, :polyline, :distance, :time
  json.url trip_url(trip, format: :json)
end
