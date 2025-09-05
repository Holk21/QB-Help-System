
local QBCore = exports['qb-core']:GetCoreObject()
local isOpen = false
local helpToken = nil

local function GenerateToken()
    local t = tostring(math.random(1000000, 9999999)) .. tostring(GetGameTimer())
    return t
end

-- COMMAND ONLY open
RegisterCommand('help', function()
    if isOpen then return end
    if not helpToken then helpToken = GenerateToken() end
    OpenHelpUI()
end, false)

-- Optional keybind
RegisterKeyMapping('help', 'Open Help Tablet', 'keyboard', 'F10')

RegisterNUICallback('close', function(_, cb)
    SetNuiFocus(false, false)
    isOpen = false
    cb('ok')
end)

RegisterNUICallback('notify', function(data, cb)
    local msg = data and data.message or 'Done'
    if Config.UseOkOk then
        TriggerEvent('okokNotify:Alert', 'Help', msg, 3000, 'info')
    else
        QBCore.Functions.Notify(msg, 'primary', 3000)
    end
    cb('ok')
end)

-- Close with ESC/BACK when open
CreateThread(function()
    while true do
        local sleep = 500
        if isOpen then
            sleep = 0
            if IsControlJustPressed(0, 177) or IsControlJustPressed(0, 322) then -- BACKSPACE or ESC
                SetNuiFocus(false, false)
                isOpen = false
                SendNUIMessage({ ns = 'qb-help', action = 'toggle', show = false, token = helpToken })
            end
        end
        Wait(sleep)
    end
end)

-- Live status updates every 2s while open (in-game clock/date + active players)
CreateThread(function()
    while true do
        Wait(2000)
        if isOpen and helpToken then
            -- In-game time
            local hour = GetClockHours()
            local minute = GetClockMinutes()
            local second = GetClockSeconds()
            local time = string.format("%02d:%02d:%02d", hour, minute, second)

            -- In-game date
            local day = GetClockDayOfMonth()
            local month = GetClockMonth() + 1 -- months 0-11
            local year = GetClockYear()
            local date = string.format("%02d-%02d-%04d", day, month, year)

            -- Players online (client-side)
            local playerCount = #GetActivePlayers()

            SendNUIMessage({
                ns = 'qb-help',
                action = 'status',
                token = helpToken,
                info = { time = time, date = date, players = playerCount }
            })
        end
    end
end)

function OpenHelpUI()
    local payload = {
        ns = 'qb-help',
        action = 'open',
        token = helpToken,
        config = {
            Help = Config.Help,
            ShowWelcomeTab = Config.ShowWelcomeTab,
            Welcome = Config.Welcome
        }
    }
    SetNuiFocus(true, true)
    isOpen = true
    SendNUIMessage(payload)
end
