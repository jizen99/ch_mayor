CH_Mayor = CH_Mayor or {}
CH_Mayor.Config = CH_Mayor.Config or {}
CH_Mayor.Catalog = CH_Mayor.Catalog or {}
CH_Mayor.Upgrades = CH_Mayor.Upgrades or {}

-- SET LANGUAGE
-- Available languages: English: en - French: fr - Danish: da - Spanish: es - Polish: pl
CH_Mayor.Config.Language = "en" -- Set the language of the script.

--[[
	TEAMS CONFIG
--]]
CH_Mayor.Config.MayorTeam = "Mayor" -- Name of your mayor team.

CH_Mayor.Config.GovernmentTeams = { -- Teams that are considered government.
	["Police Officer"] = true,
	["Police Chief"] = true,
	["Civil Protection"] = true,
	["Medic"] = true,
	["SWAT"] = true,
}

CH_Mayor.Config.PoliceTeams = { -- Teams that are considered police teams (for example counts towards when you can rob the vault).
	["Police Officer"] = true,
	["Police Chief"] = true,
	["Civil Protection"] = true,
	["SWAT"] = true,
}

CH_Mayor.Config.CriminalTeams = { --Teams that are considered criminals. These can rob the vault.
	["Citizen"] = true,
	["Gangster"] = true,
}

--[[
	GENERAL CONFIG
--]]
CH_Mayor.Config.NotificationTime = 10 -- Amount of seconds the notification display for DarkRP
CH_Mayor.Config.DistanceTo3D2D = 500000 -- Distance to draw 3d2d on entities

CH_Mayor.Config.UseMayorMenuKey = true -- Should we enable the key to open the mayor menu?
CH_Mayor.Config.MayorMenuKey = KEY_F7 -- The key that opens the mayor menu. You can find all keys here: https://wiki.garrysmod.com/page/Enums/KEY

CH_Mayor.Config.UseMayorChatCommand = true -- Should we enable the chat command to open the mayor menu?
CH_Mayor.Config.MayorMenuChatCommand = "!mayor" -- Chat command to open the mayor menu.

--[[
	VAULT CONFIG
--]]
CH_Mayor.Config.PermanentlySaveVaultMoney = false -- Should vault money be stored in the database and move over on server restarts?

CH_Mayor.Config.VaultGenerateMoney = true -- Should money automatically be generated in the vault?
CH_Mayor.Config.GenerateMoneyInterval = 60 -- Every x seconds money will be generated in the vault.
CH_Mayor.Config.GenerateMoneyMin = 50 -- Minimum amount of money generated in the vault every time the interval runs.
CH_Mayor.Config.GenerateMoneyMax = 150 -- Maximum amount of money generated in the vault every time the interval runs.

CH_Mayor.Config.VaultDefaultMax = 100000 -- The default max money the vault can hold

CH_Mayor.Config.VaultBodygroupLevels = { -- The bodygroups for the vault change based on how much money there is. For example it will be bodygroup 1 when it has 1 dollar and bodygroup 2 when it has 6000 dollars.
	[1] = 1,
	[2] = 6000,
	[3] = 9000,
	[4] = 18000,
	[5] = 27000,
	[6] = 36000,
	[7] = 45000,
}

CH_Mayor.Config.EnableDeposit = true -- Should mayor be able to deposit funds into the bank vault himself?
CH_Mayor.Config.DepositMaximumPerMayor = 5000 -- How much money can a mayor deposit in total? This resets when they're demoted/leaves

CH_Mayor.Config.EnableWithdraw = true -- Should mayor be able to withdraw money to himself from the vault?
CH_Mayor.Config.WithdrawMaximumPerMayor = 5000 -- How much money can a mayor withdraw in total? This resets when they're demoted/leaves

CH_Mayor.Config.MustBeCloseToVault = true -- If the mayor must be close to the vault to withdraw/deposit money?

--[[
	ROBBERY CONFIG
--]]
CH_Mayor.Config.MayorRequiredToRob = true -- If this is set to true then there must be an active mayor to rob the mayor vault.
CH_Mayor.Config.PoliceRequired = 3 -- How many police officers are required before a criminal can start a robbery?
CH_Mayor.Config.PlayersRequired = 5 -- How many total players are required to start a robbery?
CH_Mayor.Config.RobberyAliveTime = 1 -- For how many minutes must a player stay alive to succeed with the robbery? (IN MINUTES)
CH_Mayor.Config.RobberyDistance = 50000 -- How far away can the player move from the vault before the robbery fails
CH_Mayor.Config.RobberyCooldownTime = 5 -- How long time is the mayor vault on a cooldown (cannot be robbed) after a robbery attempt? (IN MINUTES)

CH_Mayor.Config.EmitSoundOnRob = true -- Should an alarm go off when the bank vault gets robbed.
CH_Mayor.Config.TheSound = "ambient/alarms/alarm_citizen_loop1.wav" -- The sound to be played.
CH_Mayor.Config.SoundVolume = 100 -- The sound volume for the alarm sound https://wiki.facepunch.com/gmod/Enums/SNDLVL
CH_Mayor.Config.SoundDuration = 30  -- Amount of seconds the sound should play for.

CH_Mayor.Config.KillReward = 5000 -- The reward for killing an active robber.

CH_Mayor.Config.XPSuccessfulRobbery = 100 -- XP given for succesfully robbing the vault.
CH_Mayor.Config.XPStoppingRobber = 50 -- XP given for killing a vault robber.

--[[
	OFFICIALS MANAGEMENT
	The first team is the team that can be promoted.
	The second part of the table are the teams that you can promote this team to.
	
	For example you can promote medics to medic chief or medic overhead.
	Or you can promote the police officer team to police chief.
--]]
CH_Mayor.Config.PromotableTeams = {
	["Medic"] = {
		"Medic Chief",
		"Medic Overhead",
	},
	["Police Officer"] = {
		"Police Chief",
	},
	["Police Chief"] = {
		"SWAT",
		"SWAT Chief",
	},
}

--[[
	CIVILIAN MANAGEMENT
--]]
CH_Mayor.Config.MaximumWantedTime = 300 -- Maximum amount of seconds mayor can make a player wanted for

--[[
	TAXES
	Command to generate random taxes for all your darkrp teams: ch_mayor_randomtaxes
--]]
CH_Mayor.Config.TeamsTaxes = { -- Teams and their default taxes. If team is not listed, then it does not pay taxes.
	["Citizen"] = 20,
	["Guard"] = 10,
	["Gun Dealer"] = 5,
	["Hobo"] = 25,
	["Medic"] = 0,
	["Police Officer"] = 50,
	["SWAT"] = 20,
	["SWAT Sniper"] = 10,
	["Secret Service"] = 5,
	["Hitman"] = 25,
	["Kidnapper"] = 0,
	["Thief"] = 50,
	["Gangster"] = 20,
	["Mob boss"] = 10,
	["Pro Thief"] = 5,
	["SWAT Leader"] = 25,
	["VIP Secret Service"] = 0,
	["Staff On Duty"] = 50,
}

CH_Mayor.Config.MaximumTeamTax = 80 -- What is the maximum team tax a team can have?

CH_Mayor.Config.ResetTeamTaxOnDemoted = true -- Should all team taxes reset to their default when a mayor leaves/is demoted?

CH_Mayor.Config.TaxMoneyGoesToCityVault = true -- Should money paid in taxes on paychecks go to the city vault? If true then yes, if false it just dissapears
CH_Mayor.Config.TaxMoneyCityVaultNotify = false -- Should the mayor receive a notitication of receiving money in vault when it's tax money from salaries? (Could case a little bit of spam with a lot of people)

--[[
	LAWS
--]]
CH_Mayor.Config.ResetLawsOnDemote = true -- Should laws reset when the mayor is demoted/leaves?

CH_Mayor.Config.NotifyAllOnNewLaw = true -- Should we notify all players that a new law was added?

--[[
	CATALOG
--]]
CH_Mayor.Config.RemoveCatalogEntsOnDemote = true -- Should we remove entities bought via catalog on demote? Like boards, screens, props, etc

--[[
	TRASHCAN
--]]
CH_Mayor.Config.TrashcanEntities = { -- List of entities that the trashcan can remove plus their min/max pays for trashing.
	["prop_physics"] = { 10, 50 }, -- The 10 is the minimum and 50 is the maximum reward for prop_physics throw in trash
	["drug"] = { 10, 50 },
	["drug_lab"] = { 10, 50 },
	["food"] = { 10, 50 },
	["gunlab"] = { 10, 50 },
	["letter"] = { 10, 50 },
	["microwave"] = { 10, 50 },
	["money_printer"] = { 10, 50 },
	["spawned_ammo"] = { 10, 50 },
	["spawned_food"] = { 10, 50 },
	["spawned_money"] = { 10, 50 },
	["spawned_shipment"] = { 10, 50 },
	["spawned_weapon"] = { 10, 50 },
}

CH_Mayor.Config.TrashcanModel = "models/props_junk/TrashDumpster01a.mdl" -- Sets the model for the trashcan
CH_Mayor.Config.EnableTrashReward = true -- Should players receive money for trashing items?

CH_Mayor.Config.EnableTrashXPReward = false -- If we should also receive XP rewards for trashing items.
CH_Mayor.Config.TrashXPReward = 10 -- How much XP?

--[[
	MAYOR DEATH
--]]
CH_Mayor.Config.DemoteMayorOnDeath = false -- Should the mayor be demoted on death?

--[[
	ANNOUNCEMENTS
--]]
CH_Mayor.Config.NewAnnouncementScreenFlashTime = 10 -- For how many seconds will the screen flash when a new announcement is made?