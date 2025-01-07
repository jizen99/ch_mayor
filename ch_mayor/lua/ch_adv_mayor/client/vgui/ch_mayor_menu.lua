CH_Mayor.Colors = CH_Mayor.Colors or {}
CH_Mayor.Materials = CH_Mayor.Materials or {}

CH_Mayor.ScrW = ScrW()
CH_Mayor.ScrH = ScrH()

--[[
	Cache materials
--]]
CH_Mayor.Materials.CheckmarkIcon = Material( "materials/craphead_scripts/advanced_mayor/gui/checkmark.png", "noclamp smooth" )
CH_Mayor.Materials.CloseIcon = Material( "materials/craphead_scripts/advanced_mayor/gui/close.png", "noclamp smooth" )
CH_Mayor.Materials.BackIcon = Material( "materials/craphead_scripts/advanced_mayor/gui/entities/arrowbtn.png", "noclamp smooth" )
CH_Mayor.Materials.BackIconBig = Material( "materials/craphead_scripts/advanced_mayor/gui/entities/arrowbtn.png", "noclamp smooth" )

CH_Mayor.Materials.WavingHand = Material( "materials/craphead_scripts/advanced_mayor/gui/waving_hand.png", "noclamp smooth" )
CH_Mayor.Materials.Cursor = Material( "materials/craphead_scripts/advanced_mayor/gui/entities/cursor.png", "noclamp smooth" )
CH_Mayor.Materials.StripesBG = Material( "materials/craphead_scripts/advanced_mayor/gui/bg_stripes.png", "noclamp smooth" )

CH_Mayor.Materials.Icon_Dashboard = Material( "materials/craphead_scripts/advanced_mayor/gui/dashboard.png", "noclamp smooth" )
CH_Mayor.Materials.Icon_Upgrades = Material( "materials/craphead_scripts/advanced_mayor/gui/upgrades.png", "noclamp smooth" )
CH_Mayor.Materials.Icon_Taxes = Material( "materials/craphead_scripts/advanced_mayor/gui/taxes.png", "noclamp smooth" )
CH_Mayor.Materials.Icon_Catalog = Material( "materials/craphead_scripts/advanced_mayor/gui/catalog.png", "noclamp smooth" )
CH_Mayor.Materials.Icon_Laws = Material( "materials/craphead_scripts/advanced_mayor/gui/laws.png", "noclamp smooth" )
CH_Mayor.Materials.Icon_Licenses = Material( "materials/craphead_scripts/advanced_mayor/gui/licenses.png", "noclamp smooth" )
CH_Mayor.Materials.Icon_OfficialsManagement = Material( "materials/craphead_scripts/advanced_mayor/gui/officials_management.png", "noclamp smooth" )
CH_Mayor.Materials.Icon_CivilianManagement = Material( "materials/craphead_scripts/advanced_mayor/gui/civilian_management.png", "noclamp smooth" )
CH_Mayor.Materials.Icon_Wanted = Material( "materials/craphead_scripts/advanced_mayor/gui/wanted.png", "noclamp smooth" )
CH_Mayor.Materials.Icon_Warrant = Material( "materials/craphead_scripts/advanced_mayor/gui/warrant.png", "noclamp smooth" )
CH_Mayor.Materials.Icon_Announcement = Material( "materials/craphead_scripts/advanced_mayor/gui/announcement.png", "noclamp smooth" )
CH_Mayor.Materials.Icon_Lockdown = Material( "materials/craphead_scripts/advanced_mayor/gui/lockdown.png", "noclamp smooth" )
CH_Mayor.Materials.Icon_Economy = Material( "materials/craphead_scripts/advanced_mayor/gui/economy.png", "noclamp smooth" )

CH_Mayor.Materials.Icon_ItemInspect = Material( "materials/craphead_scripts/advanced_mayor/gui/inspect.png", "noclamp smooth" )

CH_Mayor.Materials.Icon_Ent_AnnouncementLeft = Material( "materials/craphead_scripts/advanced_mayor/gui/entities/announcement_left.png", "noclamp smooth" )
CH_Mayor.Materials.Icon_Ent_AnnouncementRight = Material( "materials/craphead_scripts/advanced_mayor/gui/entities/announcement_right.png", "noclamp smooth" )
CH_Mayor.Materials.Icon_Ent_Wanted = Material( "materials/craphead_scripts/advanced_mayor/gui/entities/wanted.png", "noclamp smooth" )
CH_Mayor.Materials.Icon_Ent_Exclamation = Material( "materials/craphead_scripts/advanced_mayor/gui/entities/danger.png", "noclamp smooth" )
CH_Mayor.Materials.Icon_Ent_Leaderboard = Material( "materials/craphead_scripts/advanced_mayor/gui/entities/trophy.png", "noclamp smooth" )
CH_Mayor.Materials.Icon_Ent_Cityboard = Material( "materials/craphead_scripts/advanced_mayor/gui/entities/city_board.png", "noclamp smooth" )

CH_Mayor.Materials.Icon_Ent_Leaderboard_First = Material( "materials/craphead_scripts/advanced_mayor/gui/entities/first.png", "noclamp smooth" )
CH_Mayor.Materials.Icon_Ent_Leaderboard_Second = Material( "materials/craphead_scripts/advanced_mayor/gui/entities/second.png", "noclamp smooth" )
CH_Mayor.Materials.Icon_Ent_Leaderboard_Third = Material( "materials/craphead_scripts/advanced_mayor/gui/entities/third.png", "noclamp smooth" )

--[[
	Cache colors
--]]
CH_Mayor.Colors.GrayBG = Color( 30, 30, 30, 255 )
CH_Mayor.Colors.GrayFront = Color( 22, 22, 22, 255 )
CH_Mayor.Colors.GrayAlpha = Color( 22, 22, 22, 225 )

CH_Mayor.Colors.Green = Color( 52, 178, 52, 255 )
CH_Mayor.Colors.Red = Color( 201, 29, 29, 255 )
CH_Mayor.Colors.WhiteAlpha = Color( 255, 255, 255, 5 )
CH_Mayor.Colors.WhiteAlpha2 = Color( 255, 255, 255, 100 )
CH_Mayor.Colors.GMSBlue = Color( 52, 152, 219, 255 )

--[[
	Net message to show mayor menu
	-- 76561198422234222
--]]
net.Receive( "CH_Mayor_Net_ShowMayorMenu", function( len, ply )
	CH_Mayor.DashboardMenu()
end )

--[[
	If enabled then open mayor menu via a configurable key
--]]
function CH_Mayor.KeyShowMayorMenu()
	if not CH_Mayor.Config.UseMayorMenuKey then
		return
	end
	
	local ply = LocalPlayer()
	local cur_time = CurTime()
	
	if ( ply.CH_Mayor_NetDelay or 0 ) > cur_time then
		return
	end
	
	if not ply:CH_Mayor_IsMayor() then
		return
	end
	
	-- If player is mayor
	if input.IsKeyDown( CH_Mayor.Config.MayorMenuKey ) then
		CH_Mayor.DashboardMenu()
		
		ply.CH_Mayor_NetDelay = cur_time + 2
	end
end
hook.Add( "Think", "CH_Mayor.KeyShowMayorMenu", CH_Mayor.KeyShowMayorMenu )