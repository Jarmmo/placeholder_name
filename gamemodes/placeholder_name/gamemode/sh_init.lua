GM.Name = "placeholder_name"
GM.Author = "Jarmmo"

function GM:Initialize()
	if SERVER then
		RunConsoleCommand("sv_airaccelerate",1000)
		RunConsoleCommand("sv_sticktoground",0)
	end
end

function GM:CreateTeams()
	team.SetUp( 0, "Spectator", Color(200, 200, 200))
	team.SetUp( 1, "Player", Color(100, 255, 100))
end

hook.Add("SetupMove", "Autohop", function( ply, move )
	if not ply:IsOnGround() and ply:KeyDown(IN_JUMP)then
		move:SetButtons( bit.band( move:GetButtons(), bit.bnot( IN_JUMP ) ) )
	end
end)

function LoadFolder(folder)
	for k,v in pairs(file.Find("placeholder_name/gamemode/"..folder.."/*.lua","LUA"))do

		if(string.StartWith(v,"sv_"))then
			include(folder.."/"..v)
		end

		if(string.StartWith(v,"sh_"))then
			include(folder.."/"..v)
			AddCSLuaFile(folder.."/"..v)
		end

		if(string.StartWith(v,"cl_"))then
			AddCSLuaFile(folder.."/"..v)
		end
	end
end

LoadFolder("core")