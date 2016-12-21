json.array!(@rates) do |rate|
  json.extract! rate, :id, :val, :book_id, :user_id
  json.url rate_url(rate, format: :json)
end
