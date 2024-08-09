local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", GetCurrentResourceName())

Hyeok_S = {}
Tunnel.bindInterface(GetCurrentResourceName(), Hyeok_S)
Hyeok_C = Tunnel.getInterface(GetCurrentResourceName(), GetCurrentResourceName())

local vehicles = {}
local checkTime = {}

function Hyeok_S.vehicleKill(attacker, isPlayer)
    local source = source
    if attacker == -1 or not isPlayer then return end
    local user_id = vRP.getUserId({attacker})

    -- vehicles 테이블이 존재하지 않는다면 킬 횟수 증가 후 최초시간 입력
    if not vehicles[user_id] then
        vehicles[user_id] = 1
        checkTime[user_id] = os.time()
        return
    end

    -- 킬 횟수 증가
    vehicles[user_id] = vehicles[user_id] + 1
    -- 설정 시간내에 설정값 이상의 킬이 발생한 경우 실행
    if vehicles[user_id] > sv_config.killThreshold then
        if os.time() - checkTime[user_id] <= sv_config.killCheckInterval * 60 then
            if sv_config.isBan then
                vRP.ban({user_id, sv_config.banMsg})
            else
                vRP.kick({user_id, sv_config.kickMsg})
            end
            return
        end
    end

    -- 주기적인 체크 작업을 비동기 처리 (설정 시간이 지나면 테이블 nil처리)
    if not vehicles[user_id.."_timer"] then
        vehicles[user_id.."_timer"] = true
        CreateThread(function()
            Wait(sv_config.killCheckInterval * 60 * 1000)
            if os.time() - checkTime[user_id] >= sv_config.killCheckInterval * 60 then
                vehicles[user_id] = nil
                checkTime[user_id] = nil
            end
            vehicles[user_id.."_timer"] = nil
        end)
    end
end