json.extract! piece, :id, :pieceowner_id, :teamcolor, :piecetype, :points, :created_at, :updated_at
json.url piece_url(piece, format: :json)
