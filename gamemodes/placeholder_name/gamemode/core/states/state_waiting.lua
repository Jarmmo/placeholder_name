local function serverf()
	print("waiting")

	events.EndEventCycle()

	hook.Add("PlayerSpawn","PlayerWait",function()
		if(player.GetCount() >= 3)then
			hook.Remove("PlayerSpawn","PlayerWait")
			states.Set("game")
		end
	end)

	for k,v in pairs(player.GetAll())do
		v:Spawn()
	end
end

local function clientf()
	print("waiting")
end

local function drawf()
	draw.SimpleText("Waiting for players...", "WaitingFont", (ScrW()/2)+(math.cos(SysTime()*6))*5, ((ScrH()/4)+(math.sin(SysTime()*-6))*5)+math.sin(SysTime()*3)*10, Color(0,0,0, 255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	draw.SimpleText("Waiting for players...", "WaitingFont", ScrW()/2, ScrH()/4+math.sin(SysTime()*3)*10, Color(255,255,255, 255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
end

states.Add({name = "waiting",server=serverf,client=clientf,draw=drawf})