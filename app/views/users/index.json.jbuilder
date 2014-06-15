json.array!(@users) do |user|
  json.extract! user, :id, :email, :password_digest, :name, :twitter_username, :github_username, :website, :date_of_birth, :bio
  json.url user_url(user, format: :json)
end
