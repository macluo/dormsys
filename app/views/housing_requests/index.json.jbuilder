json.array!(@housing_requests) do |housing_request|
  json.extract! housing_request, :id
  json.url housing_request_url(housing_request, format: :json)
end
