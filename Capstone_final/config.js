module.exports = {
  uKey : 'T3ZCQ1BucVlhU2IrWllDMlJZUmNyRGtKQW5ndUVLWmgwUlBOZlc0YzRubTZnOGFxck5IRHhrMGFsKzVGVkNJag==', // Thingplug(https://sandbox.sktiot.com) 로그인 후, `마이페이지`에 있는 사용자 인증키
  nodeID : '0.2.481.1.101.01091421501', // Device 구분을 위한 ID  (본 예제에서는 맨 뒷자리를 핸드폰 번호 사용 권장)
  passCode : '000101', // ThingPlug에 Device등록 시 사용할 Device의 비밀번호 (본 예제에서는 생년월일 사용 권장)
  appID : 'myApplication', //Application의 구분을 위한 ID
  containerName:'myContainer', // starter kit에서 생성하고 사용할 container 이름 (임의지정)
  mgmtCmdPrefix : 'myMGMT', // starter kit에서 생성하고 사용할 제어 명령 이름 접두사 (임의지정)
  cmdType : 'sensor_1' // starter kit에서 사용할 제어 타입 (임의지정)
};
