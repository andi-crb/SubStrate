json.extract! user, :id, :name, :email, :password_digest, :target_days, :created_at, :updated_at
json.url user_url(user, format: :json)