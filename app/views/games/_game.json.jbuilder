json.extract! game, :id, :status, :whiteteamcolor, :blackteamcolor, :outcome, :moves, :boardsetup, :created_at, :updated_at
json.url game_url(game, format: :json)
