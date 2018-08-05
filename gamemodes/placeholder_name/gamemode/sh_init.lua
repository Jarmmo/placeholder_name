placeholder_name={}
setmetatable(placeholder_name,{
	__index=function(self,key)
		return (GM or GAMEMODE)[key]
	end,
	__newindex=function(self,key,value)
		rawset(GM or GAMEMODE,key,value)
		return nil
	end
})

placeholder_name.Name = "placeholder_name"
placeholder_name.Author = "Jarmmo"



function placeholder_name:Initialize()
	if SERVER then
		RunConsoleCommand("sv_airaccelerate",1000)
		RunConsoleCommand("sv_sticktoground",0)
		states.Set("waiting")
	end
end

function placeholder_name:CreateTeams()
	team.SetUp( 0, "Spectator", Color(200, 200, 200))
	team.SetUp( 1, "Player", Color(100, 255, 100))
end

function LoadFolder(folder)
	for k,v in pairs(file.Find("placeholder_name/gamemode/"..folder.."/*.lua","LUA"))do
		if SERVER then
			if(string.StartWith(v,"sv_"))then
				include(folder.."/"..v)
			end

			if(string.StartWith(v,"sh_") or string.StartWith(v,"state_"))then
				include(folder.."/"..v)
				AddCSLuaFile(folder.."/"..v)
			end

			if(string.StartWith(v,"cl_"))then
				AddCSLuaFile(folder.."/"..v)
			end
		elseif CLIENT then
			if (string.StartWith(v,"sh_") or string.StartWith(v,"state_") or string.StartWith(v,"cl_")) then
				include(folder.."/"..v);	
			end
		end

	end
end

LoadFolder("core")
LoadFolder("core/states")