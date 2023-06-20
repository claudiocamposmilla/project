json.extract! user_comment, :id, :user_id, :ticket_id, :body, :created_at, :updated_at
json.url user_comment_url(user_comment, format: :json)
