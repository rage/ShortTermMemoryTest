json.array!(@results) do |result|
  json.extract! result, :id, :testcase_id, :keypressed, :keypressindex, :last_series, :timestamp
  json.url result_url(result, format: :json)
end
