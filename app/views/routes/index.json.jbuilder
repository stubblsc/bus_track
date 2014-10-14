json.array!(@routes) do |route|
  json.extract! route, :name, :longname, :color, :shape, :enabled
  json.url route_url(route, format: :json)
end
