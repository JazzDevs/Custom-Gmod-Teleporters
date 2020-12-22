AddCSLuaFile("cl_init.lua")

AddCSLuaFile("shared.lua")

include("shared.lua")

resource.AddWorkshop( "855631618" )

function ENT:Initialize()
	self:SetModel("models/lt_c/holograms/console_hr.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	

	local phys = self:GetPhysicsObject()
	
	if(phys:IsValid()) then
		
		phys:Wake()
	
	end
	
end
util.AddNetworkString("TeleporterGUI")

function ENT:Use(a, c, SIMPLE_USE)
	
	net.Start("TeleporterGUI")
	net.Send(c)
	return ""
	
end
--[[
function SetCoolDownDelay( ply ) -- and no cooldowns already setupon players wont update untill they warp again.
	
	local coolDownTime = 30

	TeleportationDelay = ( os.time() + coolDownTime )
	
	local currentTime = coolDownTime  
	local currentTimeString = tostring( currentTime )

	if currentTime <= 1 then
			
		ply:PrintMessage(HUD_PRINTTALK, "You must now wait " .. currentTimeString .. " seconds before you can teleport again." )
		
	elseif currentTime > 1 then

		ply:PrintMessage(HUD_PRINTTALK, "You must now wait " .. currentTimeString .. " seconds before you can teleport again." )
	
	end

end

function HasCoolDownDelay( ply )
	
	if TeleportationDelay then
	
		if TeleportationDelay > os.time() then
			
			local remainingTime = math.ceil( ( TeleportationDelay - os.time()) )
			local remainingTimeString = tostring( remainingTime )
			
			if remainingTime <= 1 then
			
				ply:PrintMessage(HUD_PRINTTALK, "You must now wait " .. remainingTimeString .. " seconds before you can teleport again." )
			
			elseif remainingTime > 1 then
			
				ply:PrintMessage(HUD_PRINTTALK, "You must now wait " .. remainingTimeString .. " seconds before you can teleport again." )
			
			end
			
			return false -- oh no, sadly we have to tell them to fuck off until the time is completed....
		
		else
		
			return true -- yay they can teleport again??!!!?????
		
		end
	
	else
	
		TeleportationDelay = os.time()
		
		return true -- make sure they can teleport
	
	end

end
]]--
--[[
-------------------------------------------------------
                        Admin Mode
------------------------------------------------------
]]--

concommand.Add("jjadminmode", function(ply)
    AdminModeToggle(ply)
end)

--[[
---------------------------------------------------------------------------
						Destination Commands
---------------------------------------------------------------------------
]]--
concommand.Add("jj_createwarp1",function(ply)
		
		local pos1 = ply:GetPos()
		local ang1 = ply:GetAngles()
		
		AddDestination1( ply, pos1, ang1 )
		
end )

concommand.Add("jj_createwarp2",function(ply)
		
		local pos2 = ply:GetPos()
		local ang2 = ply:GetAngles()
		
		AddDestination2( ply, pos2, ang2 )
		
end )

concommand.Add("jj_createwarp3",function(ply)
	
		local pos3 = ply:GetPos()
		local ang3 = ply:GetAngles()
		
		AddDestination3( ply, pos3, ang3 )
		
end )

concommand.Add("jj_createwarp4",function(ply)
	
		local pos4 = ply:GetPos()
		local ang4 = ply:GetAngles()
		
		AddDestination4( ply, pos4, ang4 )
		
end )

concommand.Add("jj_createwarp5",function(ply)
	
		local pos5 = ply:GetPos()
		local ang5 = ply:GetAngles()
		
		AddDestination5( ply, pos5, ang5 )
		
end )

concommand.Add("jj_createwarp6",function(ply)
	
		local pos6 = ply:GetPos()
		local ang6 = ply:GetAngles()
		
		AddDestination6( ply, pos6, ang6 )
		
end )

concommand.Add("jj_createwarp7",function(ply)
	
		local pos7 = ply:GetPos()
		local ang7 = ply:GetAngles()
		
		AddDestination7( ply, pos7, ang7 )
		
end )

concommand.Add("jj_createwarp8",function(ply)
	
		local pos8 = ply:GetPos()
		local ang8 = ply:GetAngles()
		
		AddDestination8( ply, pos8, ang8 )
		
end )
concommand.Add("jj_removewarp1",function(ply)
		
		RemoveDestination1( ply )
		
end )
concommand.Add("jj_removewarp2",function(ply)
		
		RemoveDestination2( ply )
		
end )
concommand.Add("jj_removewarp3",function(ply)
		
		RemoveDestination3( ply )
		
end )
concommand.Add("jj_removewarp4",function(ply)
		
		RemoveDestination4( ply )
		
end )
concommand.Add("jj_removewarp5",function(ply)
		
		RemoveDestination5( ply )
		
end )
concommand.Add("jj_removewarp6",function(ply)
		
		RemoveDestination6( ply )
		
end )
concommand.Add("jj_removewarp7",function(ply)
		
		RemoveDestination7( ply )
		
end )
concommand.Add("jj_removewarp8",function(ply)
		
		RemoveDestination8( ply )
		
end )
--[[
---------------------------------------------------------------------------
						Destination Functions
---------------------------------------------------------------------------
]]--
function AdminModeToggle(ply)
    local AdminMode = false
    local OldTeam = 0
    if not ply:GetBool("AdminMode", false) then
		ply:SetBool("AdminMode", true)

		ply:GodEnable()

		ply:SetMoveType(MOVETYPE_NOCLIP)
        ply:SetNoTarget(true)

        local ondutyteam = TEAM_STAFFONDUTY
        if DarkRP and ondutyteam and ondutyteam > 0 then
        	ply:SetInt("OldTeam", ply:Team())
        	ply:changeTeam(ondutyteam, true, true)			
        end
	else
		target:SetBool("AdminMode", false)

		target:GodDisable()

        target:SetMoveType(MOVETYPE_WALK)
        target:SetNoTarget(false)

        local ondutyteam = TEAM_STAFFONDUTY
        if DarkRP and ondutyteam and ondutyteam > 0 then
        	target:changeTeam(target:GetInt("OldTeam", TEAM_CITIZEN), true, true)
        end
	end 
end

function AddDestination1( Ent, Vector_, Angle_)
	if Ent:IsSuperAdmin() then
		if file.Exists( "data/j&j_warps/save1.txt", "GAME" ) then

			Ent:PrintMessage(HUD_PRINTTALK, "This warp already exists!" )
		
		else
			local Compressed_data = "steamid=" .. Ent:SteamID() .. ";vec=" .. tostring(Vector_) .. ";ang=" .. tostring(Angle_);
			
			file.CreateDir("j&j_warps")
			file.Write("j&j_warps/save1.txt", Compressed_data )
			Ent:PrintMessage(HUD_PRINTTALK, "This warp has been created!" )
		end
	else
		Ent:PrintMessage(HUD_PRINTCONSOLE, "You Do Not Have Permission To Edit Warps!")
	end
end
function RemoveDestination1( Ent )

	if Ent:IsSuperAdmin() then
		if file.Exists( "data/j&j_warps/save1.txt", "GAME" ) then
		
			file.Delete( "j&j_warps/save1.txt" )
			Ent:PrintMessage(HUD_PRINTCONSOLE, "warp1 was removed." )
			
		else
		
			Ent:PrintMessage(HUD_PRINTCONSOLE, "This warp does not exist!")
		
		end
	else
		Ent:PrintMessage(HUD_PRINTCONSOLE, "You Do Not Have Permission To Edit Warps!")
	end
end

function AddDestination2( Ent, Vector_, Angle_)
	 
	if Ent:IsSuperAdmin() then	
		if file.Exists( "data/j&j_warps/save2.txt", "GAME" ) then

			Ent:PrintMessage(HUD_PRINTTALK, "This warp already exists!" )
		
		else
			local Compressed_data = "steamid=" .. Ent:SteamID() .. ";vec=" .. tostring(Vector_) .. ";ang=" .. tostring(Angle_);
			
			file.CreateDir("j&j_warps")
			file.Write("j&j_warps/save2.txt", Compressed_data )
			Ent:PrintMessage(HUD_PRINTTALK, "This warp has been created!" )
		end
	else
		Ent:PrintMessage(HUD_PRINTCONSOLE, "You Do Not Have Permission To Edit Warps!")
	end
end

function RemoveDestination2( Ent )
	if Ent:IsSuperAdmin() then
		if file.Exists( "data/j&j_warps/save2.txt", "GAME" ) then
		
			file.Delete( "j&j_warps/save2.txt" )
			Ent:PrintMessage(HUD_PRINTCONSOLE, "warp2 was removed." )
			
		else
		
			Ent:PrintMessage(HUD_PRINTCONSOLE, "This warp does not exist!")
		
		end
	else
		Ent:PrintMessage(HUD_PRINTCONSOLE, "You Do Not Have Permission To Edit Warps!")
	end
end

function AddDestination3( Ent, Vector_, Angle_)
	if Ent:IsSuperAdmin() then	
		if file.Exists( "data/j&j_warps/save3.txt", "GAME" ) then

			Ent:PrintMessage(HUD_PRINTTALK, "This warp already exists!" )
		
		else
			local Compressed_data = "steamid=" .. Ent:SteamID() .. ";vec=" .. tostring(Vector_) .. ";ang=" .. tostring(Angle_);
			
			file.CreateDir("j&j_warps")
			file.Write("j&j_warps/save3.txt", Compressed_data )
			Ent:PrintMessage(HUD_PRINTTALK, "This warp has been created!" )
		end
	else
		Ent:PrintMessage(HUD_PRINTCONSOLE, "You Do Not Have Permission To Edit Warps!")
	end
end

function RemoveDestination3( Ent )
	if Ent:IsSuperAdmin() then
		if file.Exists( "data/j&j_warps/save3.txt", "GAME" ) then
		
			file.Delete( "j&j_warps/save3.txt" )
			Ent:PrintMessage(HUD_PRINTCONSOLE, "warp3 was removed." )
			
		else
		
			Ent:PrintMessage(HUD_PRINTCONSOLE, "This warp does not exist!")
		
		end
	else
		Ent:PrintMessage(HUD_PRINTCONSOLE, "You Do Not Have Permission To Edit Warps!")
	end
end

function AddDestination4( Ent, Vector_, Angle_)
	if Ent:IsSuperAdmin() then	
		if file.Exists( "data/j&j_warps/save4.txt", "GAME" ) then

			Ent:PrintMessage(HUD_PRINTTALK, "This warp already exists!" )
		
		else
			local Compressed_data = "steamid=" .. Ent:SteamID() .. ";vec=" .. tostring(Vector_) .. ";ang=" .. tostring(Angle_);
			
			file.CreateDir("j&j_warps")
			file.Write("j&j_warps/save4.txt", Compressed_data )
			Ent:PrintMessage(HUD_PRINTTALK, "This warp has been created!" )
		end
	else
		Ent:PrintMessage(HUD_PRINTCONSOLE, "You Do Not Have Permission To Edit Warps!")
	end
end

function RemoveDestination4( Ent )
	if Ent:IsSuperAdmin() then
		if file.Exists( "data/j&j_warps/save4.txt", "GAME" ) then
		
			file.Delete( "j&j_warps/save4.txt" )
			Ent:PrintMessage(HUD_PRINTCONSOLE, "warp4 was removed." )
			
		else
		
			Ent:PrintMessage(HUD_PRINTCONSOLE, "This warp does not exist!")
		
		end
	else
		Ent:PrintMessage(HUD_PRINTCONSOLE, "You Do Not Have Permission To Edit Warps!")
	end
end

function AddDestination5( Ent, Vector_, Angle_)
	if Ent:IsSuperAdmin() then	
		if file.Exists( "data/j&j_warps/save5.txt", "GAME" ) then

			Ent:PrintMessage(HUD_PRINTTALK, "This warp already exists!" )
		
		else
			local Compressed_data = "steamid=" .. Ent:SteamID() .. ";vec=" .. tostring(Vector_) .. ";ang=" .. tostring(Angle_);
			
			file.CreateDir("j&j_warps")
			file.Write("j&j_warps/save5.txt", Compressed_data )
			Ent:PrintMessage(HUD_PRINTTALK, "This warp has been created!" )
		end
	else
		Ent:PrintMessage(HUD_PRINTCONSOLE, "You Do Not Have Permission To Edit Warps!")
	end
end

function RemoveDestination5( Ent )
	if Ent:IsSuperAdmin() then
		if file.Exists( "data/j&j_warps/save5.txt", "GAME" ) then
		
			file.Delete( "j&j_warps/save5.txt" )
			Ent:PrintMessage(HUD_PRINTCONSOLE, "warp5 was removed." )
			
		else
		
			Ent:PrintMessage(HUD_PRINTCONSOLE, "This warp does not exist!")
		
		end
	else
		Ent:PrintMessage(HUD_PRINTCONSOLE, "You Do Not Have Permission To Edit Warps!")
	end
end

function AddDestination6( Ent, Vector_, Angle_)
	if Ent:IsSuperAdmin() then	
		if file.Exists( "data/j&j_warps/save6.txt", "GAME" ) then

			Ent:PrintMessage(HUD_PRINTTALK, "This warp already exists!" )
		
		else
			local Compressed_data = "steamid=" .. Ent:SteamID() .. ";vec=" .. tostring(Vector_) .. ";ang=" .. tostring(Angle_);
			
			file.CreateDir("j&j_warps")
			file.Write("j&j_warps/save6.txt", Compressed_data )
			Ent:PrintMessage(HUD_PRINTTALK, "This warp has been created!" )
		end
	else
		Ent:PrintMessage(HUD_PRINTCONSOLE, "You Do Not Have Permission To Edit Warps!")
	end
end

function RemoveDestination6( Ent )
	if Ent:IsSuperAdmin() then
		if file.Exists( "data/j&j_warps/save6.txt", "GAME" ) then
		
			file.Delete( "j&j_warps/save6.txt" )
			Ent:PrintMessage(HUD_PRINTCONSOLE, "warp6 was removed." )
			
		else
		
			Ent:PrintMessage(HUD_PRINTCONSOLE, "This warp does not exist!")
		
		end
	else
		Ent:PrintMessage(HUD_PRINTCONSOLE, "You Do Not Have Permission To Edit Warps!")
	end
end

function AddDestination7( Ent, Vector_, Angle_)
	if Ent:IsSuperAdmin() then	
		if file.Exists( "data/j&j_warps/save7.txt", "GAME" ) then

			Ent:PrintMessage(HUD_PRINTTALK, "This warp already exists!" )
		
		else
			local Compressed_data = "steamid=" .. Ent:SteamID() .. ";vec=" .. tostring(Vector_) .. ";ang=" .. tostring(Angle_);
			
			file.CreateDir("j&j_warps")
			file.Write("j&j_warps/save7.txt", Compressed_data )
			Ent:PrintMessage(HUD_PRINTTALK, "This warp has been created!" )
		end
	else
		Ent:PrintMessage(HUD_PRINTCONSOLE, "You Do Not Have Permission To Edit Warps!")
	end
end

function RemoveDestination7( Ent )
	if Ent:IsSuperAdmin() then
		if file.Exists( "data/j&j_warps/save7txt", "GAME" ) then
		
			file.Delete( "j&j_warps/save7.txt" )
			Ent:PrintMessage(HUD_PRINTCONSOLE, "warp7 was removed." )
			
		else
		
			Ent:PrintMessage(HUD_PRINTCONSOLE, "This warp does not exist!")
		
		end
	else
		Ent:PrintMessage(HUD_PRINTCONSOLE, "You Do Not Have Permission To Edit Warps!")
	end
end

function AddDestination8( Ent, Vector_, Angle_)
	if Ent:IsSuperAdmin() then	
		if file.Exists( "data/j&j_warps/save8.txt", "GAME" ) then

			Ent:PrintMessage(HUD_PRINTTALK, "This warp already exists!" )
		
		else
			local Compressed_data = "steamid=" .. Ent:SteamID() .. ";vec=" .. tostring(Vector_) .. ";ang=" .. tostring(Angle_);
			
			file.CreateDir("j&j_warps")
			file.Write("j&j_warps/save8.txt", Compressed_data )
			Ent:PrintMessage(HUD_PRINTTALK, "This warp has been created!" )
		end
	else
		Ent:PrintMessage(HUD_PRINTCONSOLE, "You Do Not Have Permission To Edit Warps!")
	end
end

function RemoveDestination8( Ent )
	if Ent:IsSuperAdmin() then
		if file.Exists( "data/j&j_warps/save8.txt", "GAME" ) then
		
			file.Delete( "j&j_warps/save8.txt" )
			Ent:PrintMessage(HUD_PRINTCONSOLE, "warp8 was removed." )
			
		else
		
			Ent:PrintMessage(HUD_PRINTCONSOLE, "This warp does not exist!")
		
		end
	else
		Ent:PrintMessage(HUD_PRINTCONSOLE, "You Do Not Have Permission To Edit Warps!")
	end
end
--[[
---------------------------------------------------------------------------------------------
											NETWORK SHIT
---------------------------------------------------------------------------------------------
]]--
util.AddNetworkString( "ATS_WARP_FROM_CLIENT1" )
util.AddNetworkString( "ATS_WARP_FROM_CLIENT2" )
util.AddNetworkString( "ATS_WARP_FROM_CLIENT3" )
util.AddNetworkString( "ATS_WARP_FROM_CLIENT4" )
util.AddNetworkString( "ATS_WARP_FROM_CLIENT5" )
util.AddNetworkString( "ATS_WARP_FROM_CLIENT6" )
util.AddNetworkString( "ATS_WARP_FROM_CLIENT7" )
util.AddNetworkString( "ATS_WARP_FROM_CLIENT8" )

net.Receive( "ATS_WARP_FROM_CLIENT1", function( Length, Ply )

		local Ent = net.ReadEntity()
		local pos = Ply:GetPos()
		
			if file.Exists( "data/j&j_warps/save1.txt", "GAME" ) then
			
			local Data = file.Read( "j&j_warps/save1.txt", "DATA" )
			local Strings1 = string.Explode( ";", Data )
			local Vector_1 = string.Replace(Strings1[2], "vec=", "" )
				
				Ply:Freeze(true)
				Ply:SendLua([[ surface.PlaySound( "vo/k_lab/kl_initializing02.wav" ) ]] )
				
				
				timer.Simple(4, function()
					
					local vPoint = Ply:GetPos()
					local effectdata = EffectData()
					effectdata:SetStart( vPoint )
					effectdata:SetOrigin( vPoint )
					effectdata:SetEntity( Ent )
					effectdata:SetScale( 1 )
					util.Effect( "cball_explode", effectdata )
					
					Ply:EmitSound("ambient/machines/teleport" .. math.random( 3, 4 ) ..".wav", 100)
					Ply:ScreenFade( 1, color_white, 1, 1 )
					
					
					Ply:SetPos( util.StringToType( Vector_1, "Vector") )
					Ply:SetLocalVelocity(Vector(0,0,0))
					Ply:Freeze(false)
				end)
			else		
				Ply:PrintMessage(HUD_PRINTTALK, "This warp doesnt exist!" )
			end

end )

net.Receive( "ATS_WARP_FROM_CLIENT2", function( Length, Ply )

		local Ent = net.ReadEntity()
		local pos = Ply:GetPos()
		
		
			if file.Exists( "data/j&j_warps/save2.txt", "GAME" ) then
			
				local Data = file.Read( "j&j_warps/save2.txt", "DATA" )
				local Strings2 = string.Explode( ";", Data )
				local Vector_2 = string.Replace(Strings2[2], "vec=", "" )
				
				Ply:Freeze(true)
				Ply:SendLua([[ surface.PlaySound( "vo/k_lab/kl_initializing02.wav" ) ]] )
				
				
				timer.Simple(4, function()
					
					local vPoint = Ply:GetPos()
					local effectdata = EffectData()
					effectdata:SetStart( vPoint )
					effectdata:SetOrigin( vPoint )
					effectdata:SetEntity( Ent )
					effectdata:SetScale( 1 )
					util.Effect( "cball_explode", effectdata )
					
					Ply:EmitSound("ambient/machines/teleport" .. math.random( 3, 4 ) ..".wav", 100)
					Ply:ScreenFade( 1, color_white, 1, 1 )
					
					Ply:SetPos( util.StringToType( Vector_2, "Vector") )
					Ply:SetLocalVelocity(Vector(0,0,0))
					Ply:Freeze(false)
				end)
			else		
				Ply:PrintMessage(HUD_PRINTTALK, "This warp doesnt exist!" )
			end
end )

net.Receive( "ATS_WARP_FROM_CLIENT3", function( Length, Ply )

		local Ent = net.ReadEntity()
		local pos = Ply:GetPos()
		
			if file.Exists( "data/j&j_warps/save3.txt", "GAME" ) then
			
			local Data = file.Read( "j&j_warps/save3.txt", "DATA" )
			local Strings3 = string.Explode( ";", Data )
			local Vector_3 = string.Replace(Strings3[2], "vec=", "" )
				
				Ply:Freeze(true)
				Ply:SendLua([[ surface.PlaySound( "vo/k_lab/kl_initializing02.wav" ) ]] )
				
				
				timer.Simple(4, function()
					
					local vPoint = Ply:GetPos()
					local effectdata = EffectData()
					effectdata:SetStart( vPoint )
					effectdata:SetOrigin( vPoint )
					effectdata:SetEntity( Ent )
					effectdata:SetScale( 1 )
					util.Effect( "cball_explode", effectdata )
					
					Ply:EmitSound("ambient/machines/teleport" .. math.random( 3, 4 ) ..".wav", 100)
					Ply:ScreenFade( 1, color_white, 1, 1 )
					
					Ply:SetPos( util.StringToType( Vector_3, "Vector") )
					Ply:SetLocalVelocity(Vector(0,0,0))
					Ply:Freeze(false)
				end)
					
			else		
					Ply:PrintMessage(HUD_PRINTTALK, "This warp doesnt exist!" )
			end
end )

net.Receive( "ATS_WARP_FROM_CLIENT4", function( Length, Ply )

		local Ent = net.ReadEntity()
		local pos = Ply:GetPos()
		
			if file.Exists( "data/j&j_warps/save4.txt", "GAME" ) then
			
			local Data = file.Read( "j&j_warps/save4.txt", "DATA" )
			local Strings4 = string.Explode( ";", Data )
			local Vector_4 = string.Replace(Strings4[2], "vec=", "" )
				
				Ply:Freeze(true)
				Ply:SendLua([[ surface.PlaySound( "vo/k_lab/kl_initializing02.wav" ) ]] )
				
				
				timer.Simple(4, function()
					
					local vPoint = Ply:GetPos()
					local effectdata = EffectData()
					effectdata:SetStart( vPoint )
					effectdata:SetOrigin( vPoint )
					effectdata:SetEntity( Ent )
					effectdata:SetScale( 1 )
					util.Effect( "cball_explode", effectdata )
					
					Ply:EmitSound("ambient/machines/teleport" .. math.random( 3, 4 ) ..".wav", 100)
					Ply:ScreenFade( 1, color_white, 1, 1 )
					
					Ply:SetPos( util.StringToType( Vector_4, "Vector") )
					Ply:SetLocalVelocity(Vector(0,0,0))
					Ply:Freeze(false)
				end)
					
			else		
					Ply:PrintMessage(HUD_PRINTTALK, "This warp doesnt exist!" )
			end
end )

net.Receive( "ATS_WARP_FROM_CLIENT5", function( Length, Ply )

		local Ent = net.ReadEntity()
		local pos = Ply:GetPos()
		
			if file.Exists( "data/j&j_warps/save5.txt", "GAME" ) then
			
			local Data = file.Read( "j&j_warps/save5.txt", "DATA" )
			local Strings5 = string.Explode( ";", Data )
			local Vector_5 = string.Replace(Strings5[2], "vec=", "" )
				
				Ply:Freeze(true)
				Ply:SendLua([[ surface.PlaySound( "vo/k_lab/kl_initializing02.wav" ) ]] )
				
				
				timer.Simple(4, function()
					
					local vPoint = Ply:GetPos()
					local effectdata = EffectData()
					effectdata:SetStart( vPoint )
					effectdata:SetOrigin( vPoint )
					effectdata:SetEntity( Ent )
					effectdata:SetScale( 1 )
					util.Effect( "cball_explode", effectdata )
					
					Ply:EmitSound("ambient/machines/teleport" .. math.random( 3, 4 ) ..".wav", 100)
					Ply:ScreenFade( 1, color_white, 1, 1 )
					
					Ply:SetPos( util.StringToType( Vector_5, "Vector") )
					Ply:SetLocalVelocity(Vector(0,0,0))
					Ply:Freeze(false)
				end)
					
			else		
					Ply:PrintMessage(HUD_PRINTTALK, "This warp doesnt exist!" )
			end
end )

net.Receive( "ATS_WARP_FROM_CLIENT6", function( Length, Ply )

		local Ent = net.ReadEntity()
		local pos = Ply:GetPos()
		
			if file.Exists( "data/j&j_warps/save6.txt", "GAME" ) then
			
			local Data = file.Read( "j&j_warps/save6.txt", "DATA" )
			local Strings6 = string.Explode( ";", Data )
			local Vector_6 = string.Replace(Strings6[2], "vec=", "" )
				
				Ply:Freeze(true)
				Ply:SendLua([[ surface.PlaySound( "vo/k_lab/kl_initializing02.wav" ) ]] )
				
				
				timer.Simple(4, function()
					
					local vPoint = Ply:GetPos()
					local effectdata = EffectData()
					effectdata:SetStart( vPoint )
					effectdata:SetOrigin( vPoint )
					effectdata:SetEntity( Ent )
					effectdata:SetScale( 1 )
					util.Effect( "cball_explode", effectdata )
					
					Ply:EmitSound("ambient/machines/teleport" .. math.random( 3, 4 ) ..".wav", 100)
					Ply:ScreenFade( 1, color_white, 1, 1 )
					
					Ply:SetPos( util.StringToType( Vector_6, "Vector") )
					Ply:SetLocalVelocity(Vector(0,0,0))
					Ply:Freeze(false)
				end)
					
			else		
					Ply:PrintMessage(HUD_PRINTTALK, "This warp doesnt exist!" )
			end
end )

net.Receive( "ATS_WARP_FROM_CLIENT7", function( Length, Ply )

		local Ent = net.ReadEntity()
		local pos = Ply:GetPos()
		
			if file.Exists( "data/j&j_warps/save7.txt", "GAME" ) then
			
			local Data = file.Read( "j&j_warps/save7.txt", "DATA" )
			local Strings7 = string.Explode( ";", Data )
			local Vector_7 = string.Replace(Strings7[2], "vec=", "" )
				
				Ply:Freeze(true)
				Ply:SendLua([[ surface.PlaySound( "vo/k_lab/kl_initializing02.wav" ) ]] )
				
				
				timer.Simple(4, function()
					
					local vPoint = Ply:GetPos()
					local effectdata = EffectData()
					effectdata:SetStart( vPoint )
					effectdata:SetOrigin( vPoint )
					effectdata:SetEntity( Ent )
					effectdata:SetScale( 1 )
					util.Effect( "cball_explode", effectdata )
					
					Ply:EmitSound("ambient/machines/teleport" .. math.random( 3, 4 ) ..".wav", 100)
					Ply:ScreenFade( 1, color_white, 1, 1 )
					
					Ply:SetPos( util.StringToType( Vector_7, "Vector") )
					Ply:SetLocalVelocity(Vector(0,0,0))
					Ply:Freeze(false)
				end)
					
			else		
					Ply:PrintMessage(HUD_PRINTTALK, "This warp doesnt exist!" )
			end
end )

net.Receive( "ATS_WARP_FROM_CLIENT8", function( Length, Ply )

		local Ent = net.ReadEntity()
		local pos = Ply:GetPos()
		
			if file.Exists( "data/j&j_warps/save8.txt", "GAME" ) then
			
			local Data = file.Read( "j&j_warps/save8.txt", "DATA" )
			local Strings8 = string.Explode( ";", Data )
			local Vector_8 = string.Replace(Strings8[2], "vec=", "" )
				
				Ply:Freeze(true)
				Ply:SendLua([[ surface.PlaySound( "vo/k_lab/kl_initializing02.wav" ) ]] )
				
				
				timer.Simple(4, function()
					
					local vPoint = Ply:GetPos()
					local effectdata = EffectData()
					effectdata:SetStart( vPoint )
					effectdata:SetOrigin( vPoint )
					effectdata:SetEntity( Ent )
					effectdata:SetScale( 1 )
					util.Effect( "cball_explode", effectdata )
					
					Ply:EmitSound("ambient/machines/teleport" .. math.random( 3, 4 ) ..".wav", 100)
					Ply:ScreenFade( 1, color_white, 1, 1 )
					
					Ply:SetPos( util.StringToType( Vector_8, "Vector") )
					Ply:SetLocalVelocity(Vector(0,0,0))
					Ply:Freeze(false)
				end)
					
			else		
					Ply:PrintMessage(HUD_PRINTTALK, "This warp doesnt exist!" )
			end
end )