json.array!(@testcases) do |testcase|
  json.extract! testcase, :id, :user_id, :list_id, :training, :finished
  json.url testcase_url(testcase, format: :json)
end
