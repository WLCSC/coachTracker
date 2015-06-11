json.array!(@positions) do |position|
  json.extract! position, :id, :hire, :experience, :fte, :year_id, :role_id, :person_id, :sport_id
  json.url position_url(position, format: :json)
end
