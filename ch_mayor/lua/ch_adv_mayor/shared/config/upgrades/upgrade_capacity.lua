CH_Mayor.Upgrades["upgrade_capacity"] = {
	Name = "Capacity",
	Icon = Material( "materials/craphead_scripts/advanced_mayor/gui/upgrades/capacity.png", "noclamp smooth" ),
	Description = "Increases your mayoral vaults maximum capacity.",
	Levels = {
		[1] = {
			Price = 1000,
			Description = "Increases the maximum capacity to $200,000",
			UpgradeFunction = function( ply )
				CH_Mayor.SetMaxVaultMoney( ply, 200000 )
			end,
		},
		[2] = {
			Price = 2000,
			Description = "Increases the maximum capacity to $300,000",
			UpgradeFunction = function( ply )
				CH_Mayor.SetMaxVaultMoney( ply, 300000 )
			end,
		},
		[3] = {
			Price = 3000,
			Description = "Increases the maximum capacity to $400,000",
			UpgradeFunction = function( ply )
				CH_Mayor.SetMaxVaultMoney( ply, 400000 )
			end,
		},
		[4] = {
			Price = 4000,
			Description = "Increases the maximum capacity to $500,000",
			UpgradeFunction = function( ply )
				CH_Mayor.SetMaxVaultMoney( ply, 500000 )
			end,
		},
		[5] = {
			Price = 5000,
			Description = "Increases the maximum capacity to $600,000",
			UpgradeFunction = function( ply )
				CH_Mayor.SetMaxVaultMoney( ply, 600000 )
			end,
		},
	},
	RemoveFunction = function( ply )
		CH_Mayor.SetMaxVaultMoney( ply, CH_Mayor.Config.VaultDefaultMax )
	end,
	MaxLevel = 5,
}