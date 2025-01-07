CH_Mayor.Upgrades_WalkIncreaseAmount = 0
CH_Mayor.Upgrades_RunIncreaseAmount = 0

CH_Mayor.Upgrades["upgrade_walkrun"] = {
	Name = "Fitness Subscription",
	Icon = Material( "materials/craphead_scripts/advanced_mayor/gui/upgrades/run.png", "noclamp smooth" ),
	Description = "Increase officials walk and run speeds.",
	Levels = {
		[1] = {
			Price = 1200,
			Description = "Gives all government teams 10% extra walk and run speed.",
			UpgradeFunction = function( ply )
				CH_Mayor.Upgrades_WalkIncreaseAmount = 10
				CH_Mayor.Upgrades_RunIncreaseAmount = 10
				
				hook.Add( "PlayerSpawn", "CH_Mayor_Upgrades_WalkRun", function( ply )
					timer.Simple( 1, function()
						if ply:CH_Mayor_IsGovTeam() then
							local current_walk = ply:GetWalkSpeed()
							local walk_add = ( current_walk / 100 ) * CH_Mayor.Upgrades_WalkIncreaseAmount
							ply:SetWalkSpeed( current_walk + walk_add )
							
							local current_run = ply:GetRunSpeed()
							local run_add = ( current_run / 100 ) * CH_Mayor.Upgrades_RunIncreaseAmount
							ply:SetRunSpeed( current_walk + walk_add )
						end
					end )
				end )
			end,
		},
		[2] = {
			Price = 2000,
			Description = "Gives all government teams 15% extra walk and run speed.",
			UpgradeFunction = function( ply )
				CH_Mayor.Upgrades_WalkIncreaseAmount = 15
				CH_Mayor.Upgrades_RunIncreaseAmount = 15
			end,
		},
		[3] = {
			Price = 4250,
			Description = "Gives all government teams 20% extra walk and run speed.",
			UpgradeFunction = function( ply )
				CH_Mayor.Upgrades_WalkIncreaseAmount = 20
				CH_Mayor.Upgrades_RunIncreaseAmount = 20
			end,
		},
		[4] = {
			Price = 7500,
			Description = "Gives all government teams 25% extra walk and run speed.",
			UpgradeFunction = function( ply )
				CH_Mayor.Upgrades_WalkIncreaseAmount = 25
				CH_Mayor.Upgrades_RunIncreaseAmount = 25
			end,
		},
		[5] = {
			Price = 1250,
			Description = "Gives all government teams 30% extra walk and run speed.",
			UpgradeFunction = function( ply )
				CH_Mayor.Upgrades_WalkIncreaseAmount = 30
				CH_Mayor.Upgrades_RunIncreaseAmount = 30
			end,
		},
	},
	RemoveFunction = function( ply )
		hook.Remove( "PlayerSpawn", "CH_Mayor_Upgrades_WalkRun" )
		
		CH_Mayor.Upgrades_WalkIncreaseAmount = 0
		CH_Mayor.Upgrades_RunIncreaseAmount = 0
	end,
	MaxLevel = 5,
}