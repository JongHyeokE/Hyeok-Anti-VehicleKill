vRP = Proxy.getInterface("vRP")

Hyeok_C = {}
Tunnel.bindInterface(GetCurrentResourceName(), Hyeok_C)
Proxy.addInterface(GetCurrentResourceName(), Hyeok_C)
Hyeok_S = Tunnel.getInterface(GetCurrentResourceName(), GetCurrentResourceName())

local already_died = false

AddEventHandler('gameEventTriggered', function(name, args)
    if already_died then return end
    GameEventTriggered(name, args)
end)

function GameEventTriggered(eventName, data)
    if eventName == "CEventNetworkEntityDamage" then
        local victim = tonumber(data[1]) -- 죽은사람
        local attacker = tonumber(data[2]) -- 죽인사람
        local weaponHash = tonumber(data[7]) -- 무기 해쉬값
        local victimDied = (GetEntityHealth(victim) - 120) <= 0 -- 죽은사람 코마상태 
        local isPlayer = IsPedAPlayer(attacker) -- 죽인사람이 NPC를 제외 한 사람일때
        local PlayerPed = PlayerPedId() -- 서버에 있는 사람인지
        
        if victim == PlayerPed and victimDied then
            local attackerid = attacker ~= -1 and GetPlayerServerId(NetworkGetPlayerIndexFromPed(attacker)) or tostring(attacker)
            -- 차량 킬만 인식
            if weaponHash == 133987706 or weaponHash == -1553120962 then
                Hyeok_S.vehicleKill({attackerid, isPlayer})
                
                already_died = true
                while (GetEntityHealth(GetPlayerPed(-1)) - 120) <= 0 do
                    Citizen.Wait(100)
                end
                already_died = false
            end
        end
    end
end