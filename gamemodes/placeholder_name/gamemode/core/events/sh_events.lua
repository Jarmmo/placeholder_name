events = {}
events.ValidEvents = {}

events.AddEvent = function(event)
	events.ValidEvents[event.name] = event
end

if SERVER then
	util.AddNetworkString("Event")

	local CurrentEvent,NextEvent

	events.StartEventCycle = function(new)
		CurrentEvent = NextEvent
		::retry::
		NextEvent = table.Random(events.ValidEvents)

		if(new)then CurrentEvent = nil end

		if(NextEvent == CurrentEvent)then
			goto retry
		end

		if(CurrentEvent != nil)then
			CurrentEvent.server()
			net.Start("Event")
			net.WriteString(CurrentEvent.name)
			net.WriteString(NextEvent.name)
			net.Broadcast()
		else
			net.Start("Event")
			net.WriteString("")
			net.WriteString(NextEvent.name)
			net.Broadcast()
		end
		timer.Create("EventTimer",10,1,events.StartEventCycle)
	end

	events.EndEventCycle = function()
		timer.Destroy("EventTimer")
	end
elseif CLIENT then
	local CurrentEvent,NextEvent
	time2 = 0
	net.Receive("Event",function()
		CurrentEvent = events.ValidEvents[net.ReadString()]
		NextEvent = events.ValidEvents[net.ReadString()]
		time2 = SysTime()
		if(CurrentEvent != nil)then
			CurrentEvent.client()
			hook.Remove("HUDPaint","EventHUD")
			if(CurrentEvent.draw != nil)then
				hook.Add("HUDPaint","EventHUD",CurrentEvent.draw)
			end
		end
	end)

	events.GetCurrentEvent = function() return CurrentEvent end
	events.GetNextEvent = function() return NextEvent end
end