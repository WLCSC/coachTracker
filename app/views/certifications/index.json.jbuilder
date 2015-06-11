json.array!(@certifications) do |certification|
  json.extract! certification, :id, :course_id, :year_id, :person_id
  json.url certification_url(certification, format: :json)
end
