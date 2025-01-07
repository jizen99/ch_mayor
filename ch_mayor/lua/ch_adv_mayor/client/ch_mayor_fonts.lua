--[[
	Create scaled fonts
--]]
local CH_Mayor_FontSizes = { "8", "9", "10", "12", "14", "18" }

local function CH_Mayor_CreateFonts()
	for k, font in ipairs( CH_Mayor_FontSizes ) do
		local font_path = "Open Sans"
		local boldness = 500
		
		-- Mayor Fonts
		surface.CreateFont( "CH_Mayor_Font_Size".. font, {
			font = font_path, 
			size = ScreenScale( font ), 
			weight = boldness
		} )
	end
end

CH_Mayor_CreateFonts()

--[[
	Update when screen sizes changes
--]]
local function CH_Mayor_OnScreenSizeChanged()
	CH_Mayor.ScrW = ScrW()
	CH_Mayor.ScrH = ScrH()
	
	-- Recreate fonts
    CH_Mayor_CreateFonts()
end
hook.Add( "OnScreenSizeChanged", "CH_Mayor_OnScreenSizeChanged", CH_Mayor_OnScreenSizeChanged )

--[[
	Create non-scaled fonts
--]]
surface.CreateFont( "CH_Mayor_Font_3D2D_300", {
	font = "Open Sans", 
    size = 300,
    weight = 500
} )

surface.CreateFont( "CH_Mayor_Font_3D2D_175", {
	font = "Open Sans", 
    size = 175,
    weight = 500
} )

surface.CreateFont( "CH_Mayor_Font_3D2D_40", {
	font = "Open Sans", 
    size = 40,
    weight = 500
} )

surface.CreateFont( "CH_Mayor_Font_3D2D_45", {
	font = "Open Sans", 
    size = 45,
    weight = 500
} )

surface.CreateFont( "CH_Mayor_Font_3D2D_50", {
	font = "Open Sans", 
    size = 50,
    weight = 500
} )

surface.CreateFont( "CH_Mayor_Font_3D2D_60", {
	font = "Open Sans", 
    size = 60,
    weight = 500
} )

surface.CreateFont( "CH_Mayor_Font_3D2D_70", {
	font = "Open Sans", 
    size = 70,
    weight = 500
} )

surface.CreateFont( "CH_Mayor_Font_3D2D_80", {
	font = "Open Sans", 
    size = 80,
    weight = 500
} )

surface.CreateFont( "CH_Mayor_Font_3D2D_110", {
	font = "Open Sans", 
    size = 110,
    weight = 500
} )