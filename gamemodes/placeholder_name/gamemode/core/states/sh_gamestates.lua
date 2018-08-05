states = {}

states.ValidStates = {}

states.Set = function(state)
	if(states.ValidStates[state] != nil)then
		s = states.ValidStates[state]
		placeholder_name.State = s
		if(SERVER and s.server != nil)then
			s.server()
		elseif(CLIENT)then
			hook.Remove("HUDPaint","GameStateDraw")
			if(s.client != nil)then
				s.client()
			end
			if(s.draw != nil)then
				hook.Add("HUDPaint","GameStateDraw",s.draw)
			end
		end
	end
end

states.Add = function(state)
	states.ValidStates[state.name] = {name = state.name}
	if SERVER then
		states.ValidStates[state.name].server = state.server
	elseif CLIENT then
		states.ValidStates[state.name].client = state.client
		states.ValidStates[state.name].draw = state.draw
	end
end


	
if CLIENT then
	states.RefreshState = function()
		net.Start("RequestStateRefresh")
		net.SendToServer()
	end
	net.Receive("StateRefresh",function()
		states.Set(net.ReadString())
	end)
	hook.Add("HUDPaint","badcode",function()
		states.RefreshState()
		hook.Remove("HUDPaint","badcode")
	end)
elseif SERVER then
util.AddNetworkString("RequestStateRefresh")
util.AddNetworkString("StateRefresh")
	net.Receive("RequestStateRefresh",function(_,ply)
		net.Start("StateRefresh")
		net.WriteString(placeholder_name.State.name)
		net.Send(ply)
	end)
end

/*

{
	name = "examplestate",
	serverfunc = function(),
	clientfunc = function(),
	draw = function()	
}

*/