function serverf()
	print("game started! S")
end

function clientf()
	print("game started! C")
end

function drawf()
	draw.SimpleText("Game!", "WaitingFont", ScrW()/2, ScrH()/4, Color(255,255,255, 255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
end

states.Add({name = "game",server=serverf,client=clientf,draw=drawf})