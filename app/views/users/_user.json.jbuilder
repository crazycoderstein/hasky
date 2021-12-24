json.extract! user, :id, :username, :password_digest, :last_login, :created_at, :updated_at
json.url user_url(user, format: :json)
