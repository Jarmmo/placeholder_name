AddCSLuaFile("cl_init.lua")
AddCSLuaFile("sh_init.lua")
include("sh_init.lua")

local playermodels = 
{
	"models/player/group01/female_01.mdl",
	"models/player/group01/female_02.mdl",
	"models/player/group01/female_03.mdl",
	"models/player/group01/female_04.mdl",
	"models/player/group01/female_05.mdl",
	"models/player/group01/female_06.mdl",
	"models/player/group01/male_01.mdl",
	"models/player/group01/male_02.mdl",
	"models/player/group01/male_03.mdl",
	"models/player/group01/male_04.mdl",
	"models/player/group01/male_05.mdl",
	"models/player/group01/male_06.mdl",
	"models/player/group01/male_07.mdl",
	"models/player/group01/male_08.mdl",
	"models/player/group01/male_09.mdl"
}

function GM:PlayerInitialSpawn( ply )
	ply.SetTeam(1)
end

function GM:PlayerSpawn(ply)
	hook.Call( "PlayerLoadout", GAMEMODE, ply )
	local col = team.GetColor(ply:Team())
	ply:SetModel(table.Random(playermodels))
	ply:SetPlayerColor(Vector(col.r/255,col.g/255,col.b/255))
end