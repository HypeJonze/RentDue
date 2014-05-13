json.array!(@properties) do |property|
  json.extract! property, :id
  json.url property_url(user_properties_path, format: :json)
end
