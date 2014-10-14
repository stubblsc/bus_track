json.array!(@riders) do |rider|
  json.extract! rider, :riderType, :count, :integer, :routeID, :stopID
  json.url rider_url(rider, format: :json)
end
