json.array!(@teams) do |team|
  json.extract! team, :id, :team_name, :description
  json.url team_url(team, format: :json)
end
