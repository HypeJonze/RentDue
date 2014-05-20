json.array!(@properties) do |property|
  json.extract! property, :id, :utilies,:address
  json.start property.utilies
  json.url user_properties_url(property, format: :html)
end
