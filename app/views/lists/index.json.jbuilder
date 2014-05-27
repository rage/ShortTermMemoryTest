json.array!(@lists) do |list|
  json.extract! list, :id, :filename
  json.url list_url(list, format: :json)
end
