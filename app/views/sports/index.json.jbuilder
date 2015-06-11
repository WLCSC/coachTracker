json.array!(@sports) do |sport|
  json.extract! sport, :id, :name, :short, :start_date, :end_date, :role_id
  json.url sport_url(sport, format: :json)
end
