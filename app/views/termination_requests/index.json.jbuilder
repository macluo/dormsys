json.array!(@termination_requests) do |termination_request|
  json.extract! termination_request, :id
  json.url termination_request_url(termination_request, format: :json)
end
