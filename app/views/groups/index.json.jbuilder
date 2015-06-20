json.array!(@groups) do |group|
  json.extract! group, :id, :name, :category
  json.url group_url(group, format: :json)
end
