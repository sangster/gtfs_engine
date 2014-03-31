json.array!(@stops) do |stop|
  json.extract! stop, :id, :index, :show
  json.url stop_url(stop, format: :json)
end
