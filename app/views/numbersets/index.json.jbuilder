json.array!(@numbersets) do |numberset|
  json.extract! numberset, :id, :position, :list_id, :length, :order
  json.url numberset_url(numberset, format: :json)
end
