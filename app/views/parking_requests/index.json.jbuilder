json.array!(@parking_requests) do |parking_request|
  json.extract! parking_request, :id
  json.url parking_request_url(parking_request, format: :json)
end
