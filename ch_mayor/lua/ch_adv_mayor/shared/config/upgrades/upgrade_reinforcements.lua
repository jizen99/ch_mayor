--CH_Mayor.Upgrades_ReinforcedWeapons = {}

CH_Mayor.Upgrades["upgrade_reinforcements"] = {
	Name = "Reinforcements",
	Icon = Material( "materials/craphead_scripts/advanced_mayor/gui/upgrades/reinforcements.png", "noclamp smooth" ),
	Description = "Reinforce your police teams with extra weapons.",
	Levels = {
		[1] = {
			Price = 2500,
			Description = "Police officers receive an extra glock and fiveseven.",
			UpgradeFunction = function( ply )
				CH_Mayor.Upgrades_ReinforcedWeapons = {
					{ class = "weapon_glock2", ammotype = "pistol", ammoamount = 90 },
					{ class = "weapon_fiveseven2", ammotype = "pistol", ammoamount = 90 },
				}
				
				hook.Add( "PlayerSpawn", "CH_Mayor_Upgrades_Reinforcements", function( ply )
					timer.Simple( 1, function()
						if ply:CH_Mayor_IsPoliceTeam() then
							-- Give weapons and ammo
							for k, wep in pairs( CH_Mayor.Upgrades_ReinforcedWeapons ) do
								ply:Give( wep.class )
								ply:GiveAmmo( wep.ammoamount, wep.ammotype, true )
							end
						end
					end )
				end )
			end,
		},
		[2] = {
			Price = 5000,
			Description = "Police officers receive an extra mp5, mac10 and deagle.",
			UpgradeFunction = function( ply )
				CH_Mayor.Upgrades_ReinforcedWeapons = {
					{ class = "weapon_mp52", ammotype = "smg1", ammoamount = 90 },
					{ class = "weapon_mac102", ammotype = "smg1", ammoamount = 90 },
					{ class = "weapon_deagle2", ammotype = "pistol", ammoamount = 90 },
				}
			end,
		},
		[3] = {
			Price = 10000,
			Description = "Police officers receive an extra ak47, mp5 and deagle.",
			UpgradeFunction = function( ply )
				CH_Mayor.Upgrades_ReinforcedWeapons = {
					{ class = "weapon_ak472", ammotype = "ar2", ammoamount = 90 },
					{ class = "weapon_mp52", ammotype = "smg1", ammoamount = 90 },
					{ class = "weapon_deagle2", ammotype = "pistol", ammoamount = 90 },
				}
			end,
		},
	},
	RemoveFunction = function( ply )
		hook.Remove( "PlayerSpawn", "CH_Mayor_Upgrades_Reinforcements" )
		
		CH_Mayor.Upgrades_ReinforcedWeapons = {}
	end,
	MaxLevel = 3,
}