sv_config = {}

--[[
    sv_config.killCheckInterval = 킬 체크 시간 간격 (분 단위)
        (예: 1 = 1분 동안 킬을 체크)
    sv_config.killThreshold = 킬 횟수 임계값
        (예: 3 = killCheckInterval 동안 3번 이상의 킬이 발생하면 작동)
]]

sv_config.killCheckInterval = 1
sv_config.killThreshold = 3

--[[
    sv_config.isBan = 차단 여부
        (true = 차단, false = 차단 안함)
    sv_config.banMsg = 차단 메시지
    sv_config.kickMsg = 추방 메시지
]]

sv_config.isBan = false
sv_config.banMsg = "차량을 이용한 비정상적인 킬 행위가 감지되어 '차단'되었습니다."
sv_config.kickMsg = "차량을 이용한 비정상적인 킬 행위가 감지되어 '추방'되었습니다."