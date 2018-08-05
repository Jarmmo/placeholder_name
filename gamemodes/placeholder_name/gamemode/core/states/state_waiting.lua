function serverf()
end

function clientf()
end

function drawf()
	draw.SimpleText("Waiting for players...", "WaitingFont", (ScrW()/2)+(math.cos(SysTime()*3))*2.5, ((ScrH()/4)+(math.sin(SysTime()*3))*2.5)+math.sin(SysTime()*3)*10, Color(255,255,255, 255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	draw.SimpleText("Waiting for players...", "WaitingFont", ScrW()/2, ScrH()/4+math.sin(SysTime()*3)*10, Color(0,0,0, 255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
end

states.Add({name = "waiting",server=serverf,client=clientf,draw=drawf})