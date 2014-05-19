json.array!(@properties ) do |property|
  json.extract! property, :id
  json.url user_properties_url(user_properties_path, format: :json)
end
