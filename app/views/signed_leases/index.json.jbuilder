json.array!(@signed_leases) do |signed_lease|
  json.extract! signed_lease, :id
  json.url signed_lease_url(signed_lease, format: :json)
end
