json.array!(@polls) do |poll|
  json.extract! poll, :id, :body, :start, :end
  json.url poll_url(poll, format: :json)
end
