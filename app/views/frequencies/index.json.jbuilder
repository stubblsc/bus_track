json.array!(@frequencies) do |frequency|
  json.extract! frequency, :route_id, :mon, :tues, :wed, :thur, :fri, :sat, :sun, :time, :end_time
  json.url frequency_url(frequency, format: :json)
end
