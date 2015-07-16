json.array!(@summaries) do |summary|
  json.extract! summary, :id, :user_id, :restaurant_id
  json.url summary_url(summary, format: :json)
end
