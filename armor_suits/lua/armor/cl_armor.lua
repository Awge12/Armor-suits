surface.CreateFont( "CSFont18", {
	font = "Arial",
	extended = false,
	size = 18,
	weight = 600,
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


net.Receive( "armorSend", function()
	local name = net.ReadString()
	
	if ( name == "nil" ) then
		hook.Remove( "HUDPaint", "armorDisplay" )
		return
	end
	
	local data = Armor:Get( name )
	
	if ( !data ) then return end
	
	local stamp = CurTime() + data.Length
	
	hook.Add( "HUDPaint", "armorDisplay", function()
	if !data then return end
		local w = ScrW()
		surface.SetFont( "CSFont18" )
		local fontw, fonth = surface.GetTextSize( data.Name )
		local adddown = 2
		local width, height = 200, 10
		surface.SetDrawColor(36, 36, 36)
		surface.DrawRect( (ScrW() * 0.5) - (width * 0.5), fonth + 30 + 8 + adddown, width, height )
		surface.SetDrawColor(76, 2, 233)
		surface.DrawRect( (ScrW() * 0.5) - (width * 0.5), fonth + 30 + 8 + adddown, math.Clamp((LocalPlayer():Health() / 100) * width, 0, width), height )
		draw.SimpleTextOutlined( LocalPlayer():Health().."HP", "Trebuchet24", w/2, fonth + 30 + 8 + (height * .5) + adddown, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )

		
		draw.SimpleTextOutlined( data.Name, "CSFont18", w/2, 30 + adddown, color_white, 1, TEXT_ALIGN_TOP, 1, Color( 36, 36, 36 ) )		
	end )
end )