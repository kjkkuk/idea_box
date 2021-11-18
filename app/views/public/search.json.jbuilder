json.ideas do
  json.array!(@ideas) do |idea|
    json.name idea.idea_name
    json.url idea_path(idea)
  end
end

json.teams do
  json.array!(@teams) do |team|
    json.name team.team_name
    json.url team_path(team)
  end
end
