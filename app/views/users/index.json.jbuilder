json.array!(@users) do |user|
  json.extract! user, :id, :userName, :password, :role
  json.url user_url(user, format: :json)
end
