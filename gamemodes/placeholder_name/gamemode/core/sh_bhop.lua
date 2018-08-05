hook.Add("SetupMove", "Autohop", function( ply, move )
	if not ply:IsOnGround() and ply:KeyDown(IN_JUMP)then
		move:SetButtons( bit.band( move:GetButtons(), bit.bnot( IN_JUMP ) ) )
	end
end)