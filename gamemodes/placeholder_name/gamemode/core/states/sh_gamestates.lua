states = {}

states.ValidStates = {}

states.Set = function(state)
	if(states.ValidStates[state] != nil)then
		s = states.ValidStates[state]
		placeholder_name.State = s
		if(SERVER)then
			states.RefreshState(s.name)
			if(s.server != nil)then
				s.server()
			end
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


states.RefreshState = function(state,ply)
	if CLIENT then
		net.Start("RequestStateRefresh")
		net.SendToServer()
	elseif SERVER then
		if(ply != nil)then
			net.Start("StateRefresh")
			net.WriteString(state)
			net.Send(ply)
		else
			net.Start("StateRefresh")
			net.WriteString(state)
			net.Broadcast()
		end
	end
end
if CLIENT then
	net.Receive("StateRefresh",function()
		states.Set(net.ReadString())
	end)
elseif SERVER then
	util.AddNetworkString("RequestStateRefresh")
	util.AddNetworkString("StateRefresh")

	hook.Add("PlayerSpawn","StateRefresh",function(ply)
		states.RefreshState(placeholder_name.State.name,ply)
	end)

	net.Receive("RequestStateRefresh",function(_,ply)
		states.RefreshState(placeholder_name.State.name,ply)
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