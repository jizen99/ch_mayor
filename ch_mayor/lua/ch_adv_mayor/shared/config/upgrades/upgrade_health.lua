CH_Mayor.Upgrades_HealthAmount = 0

CH_Mayor.Upgrades["upgrade_health"] = {
	Name = "Health Insurance",
	Icon = Material( "materials/craphead_scripts/advanced_mayor/gui/upgrades/health.png", "noclamp smooth" ),
	Description = "Upgrade officials health insurance.",
	Levels = {
		[1] = {
			Price = 2500,
			Description = "Gives all government teams 10 extra HP.",
			UpgradeFunction = function( ply )
				CH_Mayor.Upgrades_HealthAmount = 10

				hook.Add( "PlayerSpawn", "CH_Mayor_Upgrades_Health", function( ply )
					timer.Simple( 0.1, function()
						if ply:CH_Mayor_IsGovTeam() then
							ply:SetHealth( ply:Health() + CH_Mayor.Upgrades_HealthAmount )
						end
					end )
				end )
			end,
		},
		[2] = {
			Price = 4500,
			Description = "Gives all government teams 20 extra HP.",
			UpgradeFunction = function( ply )
				CH_Mayor.Upgrades_HealthAmount = 20
			end,
		},
		[3] = {
			Price = 7500,
			Description = "Gives all government teams 30 extra HP.",
			UpgradeFunction = function( ply )
				CH_Mayor.Upgrades_HealthAmount = 30
			end,
		},
		[4] = {
			Price = 15000,
			Description = "Gives all government teams 40 extra HP.",
			UpgradeFunction = function( ply )
				CH_Mayor.Upgrades_HealthAmount = 40
			end,
		},
		[5] = {
			Price = 25000,
			Description = "Gives all government teams 50 extra HP.",
			UpgradeFunction = function( ply )
				CH_Mayor.Upgrades_HealthAmount = 50
			end,
		},
	},
	RemoveFunction = function( ply )
		hook.Remove( "PlayerSpawn", "CH_Mayor_Upgrades_Health" )
		
		CH_Mayor.Upgrades_HealthAmount = 0
	end,
	MaxLevel = 5,
}