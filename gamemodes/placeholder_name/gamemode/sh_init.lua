GM.Name = "placeholder_name"
GM.Author = "Jarmmo"

function GM:Initialize()

end

function GM:CreateTeams()
	team.SetUp( 0, "Spectator", Color(200, 200, 200))
	team.SetUp( 1, "Player", Color(100, 255, 100))
end