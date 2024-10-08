# Hyeok-Anti-VehicleKill

## 오류문의(디스코드) : jonghyeoke

이 스크립트는 차량을 이용한 비정상적인 킬을 자동으로 감지하여, 해당 플레이어를 차단하거나 추방하는 기능을 제공합니다. 의도적인 차량 킬링 행위를 방지하여 공정한 게임 환경을 유지할 수 있습니다.

## 주요 기능

- **자동 감지**: 설정된 시간(`n분`) 내에 특정 횟수(`n번`) 이상 차량으로 킬을 기록한 플레이어를 자동으로 감지합니다.
- **차단/추방**: 감지된 플레이어를 자동으로 차단하거나 추방하는 기능을 제공합니다.
- **유연한 설정**: `sv_config` 파일을 통해 킬 임계값, 체크 간격 등 다양한 설정을 조정할 수 있습니다.
- **비동기 처리**: 킬 기록을 주기적으로 체크하며, 설정 시간이 지나면 자동으로 초기화합니다.

## 설정 방법

1. **`sv_config` 파일 설정**:
   - 킬 임계값(`killThreshold`): 일정 시간 내에 허용되는 최대 차량 킬 수를 설정합니다.
   - 체크 간격(`killCheckInterval`): 킬 기록을 체크할 간격을 분 단위로 설정합니다.
   - 차단 여부(`isBan`): 차단 여부를 확인합니다.
   - 차단 메세지(`banMsg`): 차단 메세지를 설정합니다.
   - 추방 메세지(`kickMsg`): 추방 메세지를 설정합니다.

2. **스크립트 설치**:
   - 스크립트를 서버에 추가하고, 리소스를 시작합니다.

3. **자동 제재**:
   - 설정된 시간 내에 설정된 킬 횟수를 초과하는 경우, 해당 플레이어를 차단하거나 추방하는 기능을 사용할 수 있습니다.


세팅값을 과도하게 설정 할 경우 무고한 피해자가 발생할 수 있으니 서버환경에 맞게 조정해서 사용해주세요.
