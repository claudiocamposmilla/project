json.extract! user_resolution, :id, :user_id, :resolution_id, :created_at, :updated_at
json.url user_resolution_url(user_resolution, format: :json)
