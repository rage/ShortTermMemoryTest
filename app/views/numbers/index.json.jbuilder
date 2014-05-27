json.array!(@numbers) do |number|
  json.extract! number, :id, :numberset_id, :position, :text
  json.url number_url(number, format: :json)
end
