CH_Mayor.Upgrades_PaycheckBonus = 0

CH_Mayor.Upgrades["upgrade_paycheck"] = {
	Name = "Paycheck Bonus",
	Icon = Material( "materials/craphead_scripts/advanced_mayor/gui/upgrades/paycheck.png", "noclamp smooth" ),
	Description = "Increases your government teams paycheck.",
	Levels = {
		[1] = {
			Price = 2500,
			Description = "10% extra money on paychecks.",
			UpgradeFunction = function( ply )
				CH_Mayor.Upgrades_PaycheckBonus = 10
			end,
		},
		[2] = {
			Price = 5000,
			Description = "20% extra money on paychecks.",
			UpgradeFunction = function( ply )
				CH_Mayor.Upgrades_PaycheckBonus = 20
			end,
		},
		[3] = {
			Price = 15000,
			Description = "30% extra money on paychecks.",
			UpgradeFunction = function( ply )
				CH_Mayor.Upgrades_PaycheckBonus = 30
			end,
		},
	},
	RemoveFunction = function( ply )
		CH_Mayor.Upgrades_PaycheckBonus = 0
	end,
	MaxLevel = 3,
}