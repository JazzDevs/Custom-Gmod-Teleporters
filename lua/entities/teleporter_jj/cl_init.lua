include("shared.lua")
include("init.lua")
surface.CreateFont( "Font1", {
	font = "Arial", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 50,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "Font2", {
	font = "Arial", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 25,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )
surface.CreateFont( "Font3", {
	font = "Arial", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 18,
	weight = 1000,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )
surface.CreateFont( "Font4", {
	font = "Arial", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 25,
	weight = 1000,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )


function ENT:Draw()

	self:DrawModel()

end

hook.Add("HUDPaint" , "DrawTeleporter" , function()

	local eye = LocalPlayer():GetEyeTrace()
	
	if eye.Entity:GetClass() == "testent" then
		
		draw.RoundedBox( 5, ScrW()/2.65, ScrH()/2.10, 500, 50, Color(200,0,0,200) )
		draw.SimpleText("Teleporter", "Font1", ScrW()/2, ScrH()/2, Color(0,0,0), 1,1)
		draw.RoundedBox( 5, ScrW()/2.30, ScrH()/1.92, 250, 30, Color(0,200,0,150) )
		draw.SimpleText("Interact To Teleport", "Font2", ScrW()/2, ScrH()/1.87, Color(0,0,0), 1,1)
		
	
	end
end)


function DrawGUI()
	
	local Frame = vgui.Create( "DFrame" )
		Frame:SetSize( 250, 400 ) 
		Frame:SetTitle( "J&J Teleporter" ) 
		Frame:SetVisible( true ) 
		Frame:SetDraggable( false ) 
		Frame:ShowCloseButton( true ) 
		Frame:MakePopup()
		Frame:Center()
		Frame:SetBackgroundBlur(true)
		
		but1 = vgui.Create("DButton", Frame)
		but1:SetSize(225, 40)
		but1:SetPos(12,30)
		but1:SetColor(Color(0,0,0))
		but1:SetText("Hoth")
		but1:SetFont("Font4")
		but1:SetVisible(true)
		but1.DoClick = function()
			net.Start( "ATS_WARP_FROM_CLIENT1" )
			net.WriteEntity( ply )
			net.SendToServer()
			Frame:Close()
		end
		
		but2 = vgui.Create("DButton", Frame)
		but2:SetSize(225, 40)
		but2:SetPos(12,75)
		but2:SetColor(Color(0,0,0))
		but2:SetText("Bridge Checkpoint")
		but2:SetFont("Font4")
		but2:SetVisible(true)
		but2.DoClick = function()
			net.Start( "ATS_WARP_FROM_CLIENT2" )
			net.WriteEntity( ply )
			net.SendToServer()
			Frame:Close()
		end
		
		but3 = vgui.Create("DButton", Frame)
		but3:SetSize(225, 40)
		but3:SetPos(12,120)
		but3:SetColor(Color(0,0,0))
		but3:SetText("Main Hangar Bay")
		but3:SetFont("Font4")
		but3:SetVisible(true)
		but3.DoClick = function()
			net.Start( "ATS_WARP_FROM_CLIENT3" )
			net.WriteEntity( ply )
			net.SendToServer()
			Frame:Close()
		end
		
		but4 = vgui.Create("DButton", Frame)
		but4:SetSize(225, 40)
		but4:SetPos(12,165)
		but4:SetColor(Color(0,0,0))
		but4:SetText("Death Star")
		but4:SetFont("Font4")
		but4:SetVisible(true)
		but4.DoClick = function()
			net.Start( "ATS_WARP_FROM_CLIENT4" )
			net.WriteEntity( ply )
			net.SendToServer()
			Frame:Close()
		end
		
		but5 = vgui.Create("DButton", Frame)
		but5:SetSize(225, 40)
		but5:SetPos(12,210)
		but5:SetColor(Color(0,0,0))
		but5:SetText("High Command Bunks")
		but5:SetFont("Font3")
		but5:SetVisible(true)
		but5.DoClick = function()
			net.Start( "ATS_WARP_FROM_CLIENT5" )
			net.WriteEntity( ply )
			net.SendToServer()
			Frame:Close()
		end
		
		but6 = vgui.Create("DButton", Frame)
		but6:SetSize(225, 40)
		but6:SetPos(12,255)
		but6:SetColor(Color(0,0,0))
		but6:SetText("Debrief")
		but6:SetFont("Font4")
		but6:SetVisible(true)
		but6.DoClick = function()
			net.Start( "ATS_WARP_FROM_CLIENT6" )
			net.WriteEntity( ply )
			net.SendToServer()
			Frame:Close()
		end
		
		but7 = vgui.Create("DButton", Frame)
		but7:SetSize(225, 40)
		but7:SetPos(12,300)
		but7:SetColor(Color(0,0,0))
		but7:SetText("")
		but7:SetFont("Font4")
		but7:SetVisible(true)
		but7.DoClick = function()
			net.Start( "ATS_WARP_FROM_CLIENT7" )
			net.WriteEntity( ply )
			net.SendToServer()
			Frame:Close()
		end
		
		but8 = vgui.Create("DButton", Frame)
		but8:SetSize(225, 40)
		but8:SetPos(12,345)
		but8:SetColor(Color(0,0,0))
		but8:SetText("")
		but8:SetFont("Font4")
		but8:SetVisible(true)
		but8.DoClick = function()
			net.Start( "ATS_WARP_FROM_CLIENT8" )
			net.WriteEntity( ply )
			net.SendToServer()
			Frame:Close()
		end
end


net.Receive("TeleporterGUI", DrawGUI)



