json.extract! user, :id, :email, :encrypted_password, :bio, :first_name, :last_name, :created_at, :updated_at
json.url user_url(user, format: :json)
