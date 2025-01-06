
-----------------------------------------------------

--[[
=====MOONMARAUDERS STEALER=====
 - Coded by nixer/cida/vec.
 - Credits to wuat.

]]--

------------------------------------
-------------HatsChat 2-------------
------------------------------------
--Copyright (c) 2013 my_hat_stinks--
------------------------------------

--Basic--  --DO NOT EDIT the basic theme, add your own instead!
---------
local THEME = {}
THEME.Name = "Basic"

--Everything under here is optional. If you leave anything, it reverts to these values (or something to this effect)
--Remember to change the selection line at the bottom of the file, so you don't inadvertantly break theme persistance
--___________________________________________________________________________________________________________________
THEME.Main = function( s, w, h ) --Background to the whole chatbox
	draw.RoundedBox( 4, 0, 0, w, h, HatsChat.ChatBoxCol.BG )
end
THEME.Prompt = function( s,w,h ) --The "Team" or "Say" prompt
	draw.RoundedBox( 4, 0, 0, w, h, HatsChat.ChatBoxCol.Black )
	draw.RoundedBox( 4, 1, 1, w-2, h-2, HatsChat.ChatBoxCol.WhiteSolid )
	
	draw.SimpleText( HatsChat.IsTeam and "Team:" or "Say:", "HatsChatPrompt", 30, 10, HatsChat.ChatBoxCol.BlackSolid, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
end
THEME.TextEntry = function( s,w,h ) --The actual text input box (Only override this if you know what you're doing)
	derma.SkinHook( "Paint", "TextEntry", s, w, h )
end
local OptionsImg = Material("icon16/cog.png")
THEME.Settings = function( s,w,h ) --Settings button, opens the settings window
	surface.SetMaterial( OptionsImg )
	surface.DrawTexturedRect( 2, 2, 16, 16 )
end
local EmoteImg = Material("icon16/emoticon_smile.png")
THEME.EmoteButton = function( s,w,h ) --Emote button, opens the emote panel
	surface.SetMaterial( EmoteImg )
	surface.DrawTexturedRect( 2, 2, 16, 16 )
end

THEME.InputPanel = function( s,w,h ) end --Frame behind prompt, input, and options button panels

THEME.ScrollMain = function( s,w,h ) end --Behind the full scroll bar
THEME.ScrollGrip = function(s,w,h) --The scrollbar grip (the bit you can grab)
	draw.RoundedBox( 4, 0, 0, w, h, HatsChat.ChatBoxCol.Black )
	draw.RoundedBox( 4, 1, 1, w-1, h-1, HatsChat.ChatBoxCol.White )
end
THEME.ScrollUp = function(s,w,h) --Scrollbar "Up" button
	draw.RoundedBox( 4, 0, 0, w, h, HatsChat.ChatBoxCol.Black )
	draw.RoundedBox( 4, 1, 1, w-1, h-1, HatsChat.ChatBoxCol.White )
end
THEME.ScrollDown = function(s,w,h) --Scrollbar "Down" button
	draw.RoundedBox( 4, 0, 0, w, h, HatsChat.ChatBoxCol.Black )
	draw.RoundedBox( 4, 1, 1, w-1, h-1, HatsChat.ChatBoxCol.White )
end

THEME.ServerBar = function( s,w,h ) --The ServerBar background, if ServerBar is enabled
	draw.RoundedBox( 4, 0, 0, w, h, HatsChat.ChatBoxCol.White )
	draw.SimpleText( s.Label or "HatsChat2", "HatsChatPrompt", 5, 0, HatsChat.ChatBoxCol.BlackStrong, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM )
end
THEME.EmoteWindow = function( s,w,h ) --Emote selection popup panel
	draw.RoundedBox( 4, 0, 0, w, h, HatsChat.ChatBoxCol.Black )
	draw.RoundedBox( 4, 1, 1, w-2, h-2, HatsChat.ChatBoxCol.White )
end

THEME.PanelBG = function( s,w,h ) --ScrollPanel background, the bit behind the line panels
	draw.RoundedBox( 0, 0, 0, w, h, HatsChat.ChatBoxCol.White )
end
THEME.PanelCanvas = function( s,w,h ) end --ScrollPanel canvas, also appears behind line panels

THEME.LinePaint = function( s,w,h ) end --Paints under individual lines
THEME.LineAnim = function( s,anim,delta ) end --Individual line animations. Automatically ran, but not automatically started.

THEME.Start = function() end --Called when this theme starts. Use to reposition elements
THEME.End = function() end --Called when this theme ends. Undo anything you did in THEME.Start
--_______________________________________________
--This is where you add your theme to the chatbox

HatsChat:RegisterTheme( THEME.Name, THEME )
HatsChat:SelectTheme( THEME.Name ) --DO NOT use this line on the other themes, this is purely for the sake of failsafe!
--if HatsChat.Settings.ChatTheme:GetString()==THEME.Name then HatsChat:SelectTheme( THEME.Name ) end --Use this line instead

