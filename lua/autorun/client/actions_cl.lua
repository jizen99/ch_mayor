--leak by matveicher
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher

surface.CreateFont("CMenu | Title", {font = "Russisch Sans SemiBold", extended = true, antialias = true, size = 20})
surface.CreateFont("CMenu | Button", {font = "Russisch Sans SemiBold", extended = true, antialias = true, size = 16})

local function MinoriText(Text, Font, w, h, ColorText, xAlign, yAlign)
    draw.Text( {
        text = Text,
        font = Font,
        pos = { w, h },
        color = ColorText,
        xalign = xAlign,
        yalign = yAlign
    } )
end

local function AddSelect(parrent, title, col, func)
    local Selected = vgui.Create("EditablePanel", parrent)
    Selected:Dock(TOP)
    Selected:SetTall(22)
    Selected:DockMargin(0, 0, 0, 0)
    Selected.Hover = 0
    Selected.Paint = function(self, w, h)
        if self:IsHovered() then
            self.Hover = Lerp(FrameTime() * 12, self.Hover, 255)
        else
            self.Hover = Lerp(FrameTime() * 12, self.Hover, 0)
        end

        MinoriText(title, 'CMenu | Button', w/2, h/2, col, 1, 1)
        MinoriText(title, 'CMenu | Button', w/2, h/2, ColorAlpha(color_white, self.Hover), 1, 1)
    end

    Selected.OnMousePressed = function(self, key)
        if key != MOUSE_LEFT then return end

        func()
    end

    parrent:AddItem(Selected)
end

local CreateTableCommand = {
    [1] = {
        name = 'Справочник',
        icon = Material('cmenu_2/notebook.png'),
        color = Color(255, 213, 66),
        submenu = false,
        access = function() end,
        command = function()
            RunConsoleCommand('load_menu')
        end
    },

    [2] = {
        name = 'Выкинуть деньги',
        icon = Material('cmenu_2/money.png'),
        color = Color(114, 201, 100),
        submenu = false, 
        access = function() end,
        command = function()
            Derma_StringRequest("Выбросить пачку денег", "Сколько вы хотите выбросить денег?", nil, function(s)
                RunConsoleCommand("darkrp", "dropmoney", s)
            end)
        end
    },

    [3] = {
        name = 'Передать деньги',
        icon = Material('cmenu_2/money.png'),
        color = Color(176, 252, 52),
        submenu = false,
        access = function() end,
        command = function()
            Derma_StringRequest("Передать деньги", "Сколько вы передать денег?", nil, function(s)
                RunConsoleCommand("darkrp", "give", s)
            end)
        end
    },

    [4] = {
        name = 'Купить патроны',
        icon = Material('cmenu_2/ammo.png'),
        color = Color(255, 70, 70),
        submenu = false,
        access = function() end,
        command = function()
            local lply = LocalPlayer()
            local wep = lply:GetActiveWeapon()
            local prim = wep.Primary and wep.Primary.Ammo or game.GetAmmoName(wep:GetPrimaryAmmoType())
            if not prim then return end
           
            RunConsoleCommand("darkrp", "buyammo", prim)
        end
    },

    [5] = {
        name = 'Выкинуть оружие',
        icon = Material('cmenu_2/gun.png'),
        color = Color(142, 142, 142),
        submenu = false,
        access = function() end,
        command = function()
            RunConsoleCommand("darkrp", "drop")
        end
    },

    [6] = {
        name = 'Бросить кубики',
        icon = Material('cmenu_2/dice.png'),
        color = Color(255, 255, 255),
        submenu = false,
        access = function() end,
        command = function()
            RunConsoleCommand('dice')
        end
    },

    [7] = {
        name = 'Вытащить карту',
        icon = Material('cmenu_2/cards.png'),
        color = Color(255, 95, 95),
        submenu = false,
        access = function() end,
        command = function()
            RunConsoleCommand('cards')
        end
    },

    [8] = {
        name = 'Играть в рулетку',
        icon = Material('cmenu_2/roulette.png'),
        color = Color(255, 157, 5),
        submenu = false,
        access = function() end,
        command = function()
            RunConsoleCommand('roll')
        end
    },

    [9] = {
        name = 'Уволить',
        icon = Material('cmenu_2/fired.png'),
        color = Color(221, 78, 78),
        submenu = true,
        access = function() end,
        command = function(self)
            local lply = LocalPlayer()
            for k, v in ipairs(player.GetAll()) do
                if v == lply then continue end

                AddSelect(self, v:Name(), team.GetColor(v:Team()), function()
                    Derma_StringRequest('Увольнение', 'Укажите причину увольнения',nil, function(a)
                        if IsValid(v) then
                            RunConsoleCommand("darkrp","demote", v:SteamID(), a)
                        end
                    end)
                end)
            end
        end
    },

    [10] = {
        name = 'Продать двери',
        icon = Material('cmenu_2/door.png'),
        color = Color(127, 65, 34),
        submenu = false,
        access = function() end,
        command = function()
            RunConsoleCommand("say","/sellalldoors")
        end
    },

    [11] = {
        name = 'Логи',
        icon = Material('cmenu_2/log.png'),
        color = Color(85, 161, 255),
        submenu = false,
        access = function() return LocalPlayer():IsAdmin() end,
        command = function()
            RunConsoleCommand('say', '/logs')
        end
    },

    [12] = {
        name = 'Админмод',
        icon = Material('cmenu_2/admin.png'),
        color = Color(207, 210, 252),
        submenu = false,
        access = function() return LocalPlayer():IsAdmin() end,
        command = function()
            RunConsoleCommand('say', '/adminmode')
        end
    },

    [13] = {
        name = 'Объявить в розыск',
        icon = Material('cmenu_2/wanted.png'),
        color = Color(255, 73, 73),
        submenu = true,
        access = function() return LocalPlayer():isCP() end,
        command = function(self)
            local lply = LocalPlayer()
            
            for k, v in ipairs(player.GetAll()) do
                if v == lply then continue end

                AddSelect(self, v:Name(), team.GetColor(v:Team()), function()
                    Derma_StringRequest('Розыск', 'Укажите причину розыска', '', function(a)
                        if IsValid(v) then
                            RunConsoleCommand("darkrp","wanted", v:SteamID(), a)
                        end
                    end)
                end)
            end
        end
    },

    [14] = {
        name = 'Снять розыск',
        icon = Material('cmenu_2/demote.png'),
        color = Color(1, 110, 161),
        submenu = true,
        access = function() return LocalPlayer():isCP() end,
        command = function(self)
            local lply = LocalPlayer()
            
            for k, v in ipairs(player.GetAll()) do
                if v == lply then continue end

                AddSelect(self, v:Name(), team.GetColor(v:Team()), function()
                    RunConsoleCommand("darkrp","unwanted", v:SteamID())
                end)
            end
        end
    },

    [15] = {
        name = 'Запросить ордер',
        icon = Material('cmenu_2/order.png'),
        color = Color(254, 145, 0),
        submenu = true,
        access = function() return LocalPlayer():isCP() end,
        command = function(self)
            local lply = LocalPlayer()
            
            for k, v in ipairs(player.GetAll()) do
                if v == lply then continue end

                AddSelect(self, v:Name(), team.GetColor(v:Team()), function()
                    Derma_StringRequest('Ордер', 'Укажите причину ордера', '', function(a)
                        if IsValid(v) then
                            RunConsoleCommand("darkrp","warrant", v:SteamID(), a)
                        end
                    end)
                end)
            end
        end
    },

    [16] = {
        name = 'Комендантский час',
        icon = Material('cmenu_2/warns.png'),
        color = Color(255, 94, 87),
        submenu = false,
        access = function() return LocalPlayer():isMayor() end,
        command = function()
            Derma_StringRequest('Комендантский час', 'Укажите причину комендантского часа', '', function(a)
                RunConsoleCommand('lockdown', a)
            end)
        end
    },

    [17] = {
        name = 'Отменить ком.час',
        icon = Material('cmenu_2/warns.png'),
        color = Color(247, 55, 47),
        submenu = false,
        access = function() return LocalPlayer():isMayor() end,
        command = function()
            RunConsoleCommand('unlockdown')
        end
    },

    [18] = {
        name = 'Запустить лотерею',
        icon = Material('cmenu_2/ticket.png'),
        color = Color(0, 255, 148),
        submenu = false,
        access = function() return LocalPlayer():isMayor() end,
        command = function()
            Derma_StringRequest('Запустить лотерею', 'Введите стоимость участия',nil, function(a)
                RunConsoleCommand('lottery', tostring(a))
            end)
        end
    },

    [19] = {
        name = 'Оповещение городу',
        icon = Material('cmenu_2/message.png'),
        color = Color(199, 207, 225),
        submenu = false,
        access = function() return LocalPlayer():isMayor() end,
        command = function()
            Derma_StringRequest('Оповещение городу', 'Введите сообщение', '', function(a)
                RunConsoleCommand('broadcast', a)
            end)
        end
    },

    [20] = {
        name = 'Законы',
        icon = Material('cmenu_2/laws.png'),
        color = Color(203, 130, 82),
        submenu = false,
        access = function() return LocalPlayer() end,
        command = function()
            RunConsoleCommand('laws')
        end
    },

    [21] = {
        name = 'Выдать лицензию',
        icon = Material('cmenu_2/license.png'),
        color = Color(255, 195, 101),
        submenu = false,
        access = function() return LocalPlayer():isMayor() end,
        command = function()
            RunConsoleCommand("darkrp","givelicense")
        end
    },

    [22] = {
        name = 'СМИ',
        icon = Material('cmenu_2/message.png'),
        color = Color(199, 207, 225),
        submenu = false,
        access = function() return LocalPlayer():Team() == TEAM_RADIO end,
        command = function()
            ui.StringRequest('Репортер', 'Введите сообщение',nil, function(a)
                RunConsoleCommand('radiobroadcast', a)
            end)
        end
    },

    [23] = {
        name = 'Питомцы',
        icon = Material('cmenu_2/peats.png'),
        color = Color(255, 213, 66),
        submenu = false,
        access = function() end,
        command = function()
            RunConsoleCommand('petmenu')
        end
    },
}

local CMenuFrame

local TitleColor = Color(41,41,41)
local BackgroundColor = Color(45,45,45, 200)
local BackgroundColorGrad = Color(35,35,35)
local SubmenuColor = Color(80,80,80)

local TitleText = 'Меню действий'

local mat_grad_u = Material("vgui/gradient-u")    
local mat_grad_l = Material("vgui/gradient-l")    
local mat_scale = Material("cmenu_2/submenu.png")    

hook.Add("OnContextMenuOpen", "CMenuOnContextMenuOpen", function()
    if IsValid(CMenuFrame) then
        CMenuFrame:Remove()
    end

    local ply = LocalPlayer()
    local scrw, scrh = ScrW(), ScrH()
    local CMD = CreateTableCommand
    local Count = 1
    local SelectTitle = 'Выбор'

    CMenuFrame = vgui.Create("EditablePanel")
    CMenuFrame:SetAlpha(0)
    CMenuFrame:AlphaTo(255, 0.4, 0)
    CMenuFrame:MakePopup()
    CMenuFrame.Paint = function(_, w, h)
        draw.RoundedBox(16, 0, 0, w, h-32, BackgroundColor)
        draw.RoundedBoxEx(16, 0, 0, w, 32, TitleColor, true, true, false, false)

        surface.SetDrawColor(BackgroundColorGrad)
        surface.SetMaterial(mat_grad_u)
        surface.DrawTexturedRect(0, 32, w, h-64)

        MinoriText(TitleText, 'CMenu | Title', 125, 5, color_white, 1, 0)
        MinoriText(SelectTitle, 'CMenu | Title', 375, 5, color_white, 1, 0)

        if not input.IsKeyDown(KEY_C) then
            _:Remove()
        end
    end

    local PanelScroll = vgui.Create("EditablePanel", CMenuFrame)
    PanelScroll:Dock(LEFT)
    PanelScroll:SetWide(250)
    PanelScroll:DockMargin(0, 32, 0, 32)

    for i=1, #CMD do
        if CMD[i].access() == false then 
            continue
        end

        local Button = vgui.Create("EditablePanel", PanelScroll)
        Button:Dock(TOP)
        Button:SetTall(22)
        Button:DockMargin(0, 0, 0, 0)
        Button.Hover = 0
        Button.Paint = function(self, w, h)
            draw.RoundedBox(0, 22, 0, 2, h, CMD[i].color)

            surface.SetDrawColor(color_white)
            surface.SetMaterial(CMD[i].icon)
            surface.DrawTexturedRect(3, h/2-8, 16, 16)

            if self:IsHovered() then
                self.Hover = Lerp(FrameTime() * 12, self.Hover, 255)
            else
                self.Hover = Lerp(FrameTime() * 12, self.Hover, 0)
            end
            
            surface.SetDrawColor(ColorAlpha(CMD[i].color, self.Hover))
            surface.SetMaterial(mat_grad_l)
            surface.DrawTexturedRect(22, 0, 227, h)

            if CMD[i].submenu then
                if self:IsHovered() then
                    surface.SetDrawColor(CMD[i].color)
                else
                    surface.SetDrawColor(color_white)
                end

                surface.SetMaterial(mat_scale)
                surface.DrawTexturedRect(228, h/2-8, 16, 16)
            end

            MinoriText(CMD[i].name, 'CMenu | Button', math.Round(30+self.Hover*0.1), h/2, color_white, 0, 1)
        end

        local dealy = 0
        Button.OnMousePressed = function(self, key)
            if key != MOUSE_LEFT then return end
            if dealy > CurTime() then return end

            if not CMD[i].submenu then
                CMD[i].command() 
            else
                if IsValid(PSCROLL) then
                    CMenuFrame:SizeTo(250, -1, 0.4, 0, 0.2)
                    PSCROLL:AlphaTo(0, 0.2, 0, function()
                        PSCROLL:Remove()
                    end)

                    return
                end

                SelectTitle = CMD[i].name

                local PanelScroll2 = vgui.Create("DScrollPanel", CMenuFrame)
                PSCROLL = PanelScroll2
                PanelScroll2:SetAlpha(0)
                PanelScroll2:AlphaTo(255, 0.3, 0) 
                PanelScroll2:Dock(RIGHT)
                PanelScroll2:SetWide(250)
                PanelScroll2:DockMargin(250, 32, 0, 32)

                CMD[i].command(PanelScroll2) 

                if PanelScroll2:ChildCount() == 0 then
                    if IsValid(PSCROLL) then
                        PSCROLL:AlphaTo(0, 0.2, 0, function()
                            PSCROLL:Remove()
                        end)
                    end

                    rp.Notify(NOTIFY_ERROR, 'Список пуст')

                    return
                end

                CMenuFrame:SizeTo(500, -1, 0.4, 0, 0.2)
            end

            dealy = CurTime() + 1
        end

        Count = Count + 1
    end

    CMenuFrame:SetSize(250, 48 + Count * 22)
    CMenuFrame:SetPos(-250, scrh/2-CMenuFrame:GetTall()/2)
    CMenuFrame:MoveTo(10, scrh/2-CMenuFrame:GetTall()/2, 0.7, 0, 0.15)
end)

hook.Add("OnContextMenuClose", "CMenuOnContextMenuClose", function()
    if CMenuFrame then
        CMenuFrame:Remove()
    end
end)
--leak by matveicher
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher