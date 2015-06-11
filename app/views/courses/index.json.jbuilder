json.array!(@courses) do |course|
  json.extract! course, :id, :name, :provider
  json.url course_url(course, format: :json)
end
