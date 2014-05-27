json.array!(@list.numbersets) do |numberset|
  json.(numberset, :id, :order, :list_id)
  json.numbers numberset.numbers, :position, :text
end
