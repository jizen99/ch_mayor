--leak by matveicher
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher#2000
--[[

Author: tochnonement
Email: tochnonement@gmail.com

02/03/2023

--]]

onyx.creditstore:Print('Loaded SQL configuration.')

local MySQL = {Credentials = {}}

-- Enable MySQL
-- (requires `mysqloo` module and mysql database)
MySQL.Enabled = false

-- MySQL Credentials
MySQL.Credentials.Hostname  = 'localhost'
MySQL.Credentials.Username  = 'username'
MySQL.Credentials.Password  = 'password'
MySQL.Credentials.Schema    = 'example'
MySQL.Credentials.Port      = 3306

--[[------------------------------
DO NOT TOUCH STUFF BELOW
--------------------------------]]
onyx.creditstore:SetupDatabase(MySQL.Enabled, MySQL.Credentials)
--leak by matveicher
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher#2000