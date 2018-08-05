function serverf()
	print("game start")

	events.StartEventCycle()

	for k,v in pairs(player.GetAll())do
		v:Spawn()
	end
end

function clientf()
	print("game start")
end

function drawf(time)
	timeex = -time+SysTime()
	timeex2 = -time2+SysTime()
	draw.SimpleText("Game start!", "WaitingFont", ScrW()/2+5, (ScrH()/4)-math.Clamp(timeex*ScrH()/4-ScrH()/4,0,ScrH())+5, Color(0,0,0, 255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	draw.SimpleText("Game start!", "WaitingFont", ScrW()/2, (ScrH()/4)-math.Clamp(timeex*ScrH()/4-ScrH()/4,0,ScrH()), Color(255,255,255, 255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	surface.SetDrawColor(255,200+math.sin(SysTime()*5)*50,200+math.sin(SysTime()*5)*50,255)
	surface.DrawRect(0,0,ScrW()-(timeex2*ScrW()/30),24)
	surface.SetDrawColor(255,0,0,255)
	surface.DrawRect(2,2,ScrW()-(timeex2*ScrW()/30)-4,20)
	surface.SetFont("EventText")
	local w,h = surface.GetTextSize("Next event in "..math.Clamp(math.Round(30-timeex2),0,30).." seconds: "..events.GetNextEvent().name)
	draw.SimpleText("Next event in "..math.Clamp(math.Round(30-timeex2),0,30).." seconds: "..events.GetNextEvent().name, "EventText", math.Clamp(ScrW()-(timeex2*ScrW()/30)-4,w,ScrW())+1, h/2+2, Color(0,0,0, 255),TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)
	draw.SimpleText("Next event in "..math.Clamp(math.Round(30-timeex2),0,30).." seconds: "..events.GetNextEvent().name, "EventText", math.Clamp(ScrW()-(timeex2*ScrW()/30)-4,w,ScrW()), h/2+1, Color(255,255,255, 255),TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)
	if(events.GetCurrentEvent() != nil)then
		draw.SimpleText("Current event: "..events.GetCurrentEvent().name, "EventText", ScrW()/2+1, 40+1, Color(0,0,0, 255),TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)
		draw.SimpleText("Current event: "..events.GetCurrentEvent().name, "EventText", ScrW()/2, 40, Color(255,255,255, 255),TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)
	end
end

states.Add({name = "game",server=serverf,client=clientf,draw=drawf})