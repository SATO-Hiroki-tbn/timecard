json.array!(@users_teams) do |users_team|
  json.extract! users_team, :id, :user_id, :team_id
  json.url users_team_url(users_team, format: :json)
end
