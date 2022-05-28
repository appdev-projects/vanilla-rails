json.extract! comment, :id, :commentor_id, :game_id, :commentroom, :commenttext, :created_at, :updated_at
json.url comment_url(comment, format: :json)
