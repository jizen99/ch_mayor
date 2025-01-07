CH_Mayor.Upgrades_ArmorAmount = 0

CH_Mayor.Upgrades["upgrade_kevlar"] = {
	Name = "Kevlar",
	Icon = Material( "materials/craphead_scripts/advanced_mayor/gui/upgrades/kevlar.png", "noclamp smooth" ),
	Description = "Equip your police officers with extra bulletproof kevlar.",
	Levels = {
		[1] = {
			Price = 1500,
			Description = "Equips the government teams with 50 extra kevlar.",
			UpgradeFunction = function( ply )
				CH_Mayor.Upgrades_ArmorAmount = 50

				hook.Add( "PlayerSpawn", "CH_Mayor_Upgrades_Kevlar", function( ply )
					timer.Simple( 0.1, function()
						if ply:CH_Mayor_IsPoliceTeam() then
							ply:SetArmor( ply:Armor() + CH_Mayor.Upgrades_ArmorAmount )
						end
					end )
				end )
			end,
		},
		[2] = {
			Price = 3500,
			Description = "Equips the government teams with 60 extra kevlar.",
			UpgradeFunction = function( ply )
				CH_Mayor.Upgrades_ArmorAmount = 60
			end,
		},
		[3] = {
			Price = 7500,
			Description = "Equips the government teams with 70 extra kevlar.",
			UpgradeFunction = function( ply )
				CH_Mayor.Upgrades_ArmorAmount = 70
			end,
		},
		[4] = {
			Price = 1350,
			Description = "Equips the government teams with 80 extra kevlar.",
			UpgradeFunction = function( ply )
				CH_Mayor.Upgrades_ArmorAmount = 80
			end,
		},
		[5] = {
			Price = 20000,
			Description = "Equips the government teams with 90 extra kevlar.",
			UpgradeFunction = function( ply )
				CH_Mayor.Upgrades_ArmorAmount = 90
			end,
		},
	},
	RemoveFunction = function( ply )
		hook.Remove( "PlayerSpawn", "CH_Mayor_Upgrades_Kevlar" )
		
		CH_Mayor.Upgrades_ArmorAmount = 0
	end,
	MaxLevel = 5,
}