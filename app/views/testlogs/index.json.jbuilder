json.array!(@testlogs) do |testlog|
  json.extract! testlog, :id, :testcase_id, :eventtype, :value, :timestamp
  json.url testlog_url(testlog, format: :json)
end
