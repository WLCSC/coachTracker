json.array!(@roles) do |role|
  json.extract! role, :id, :name, :category_id
  json.url role_url(role, format: :json)
end
