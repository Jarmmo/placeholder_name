function drawf()
	timeex = -time2+SysTime()
	surface.SetDrawColor(255,255,255,100-timeex*500)
	surface.DrawRect(0,0,ScrW(),ScrH())
end

function serverf()
	print("Swap!")
	local oldpos = {}
	for k,v in pairs(player.GetAll())do
		oldpos[k] = {pos = v:GetPos(),ang = v:EyeAngles()}
	end
	for k,v in pairs(player.GetAll())do
		if(k+1 > #oldpos)then
			v:SetPos(oldpos[1].pos)
			v:SetEyeAngles(oldpos[1].ang)
		else
			v:SetPos(oldpos[k+1].pos)
			v:SetEyeAngles(oldpos[k+1].ang)
		end
	end
end

events.AddEvent({name = "Swap!",client = function() print("Swap!") end, server = serverf,draw = drawf,drawcurrent = false})