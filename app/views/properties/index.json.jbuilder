json.array!(@properties) do |property|
  json.extract! property, :user_id,:id, :utilies,:address,:rent
  json.start property.utilies
  json.address property.address
  json.id property.id
  json.user_id property.user_id
  json.url user_properties_url(property, format: :html)
end
