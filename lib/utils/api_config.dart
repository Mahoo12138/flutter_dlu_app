class APIs {
  // url 前缀
  static const String apiPrefix = "http://202.199.157.28";
  // 教务处登录接口
  static String jwUrl =
      r"/http/77726476706e69737468656265737421a2a713d27669311e2f5ddce2cb00";
  // 体育云数据接口
  static String runUrl =
      r'/http-8081/77726476706e69737468656265737421a2a713d27669311e2f5ddce2ce07';
  // 体测系统接口
  static String tcUrl =
      r"/http-9090/77726476706e69737468656265737421a1a70fcd707e39003059dcfd/ecs/api/v1.0";
  // 天气接口
  static String weatherUrl = "http://apis.juhe.cn/simpleWeather/query";
  // 一言接口
  static String hitokoto = "https://v1.hitokoto.cn/";
}

//接口类型,依次往下加
enum APIType { VpnLogin, VpnDoLogin }
//使用：APITypeValues[APIType.Login]
const APITypeValues = {
  APIType.VpnLogin: "/login",
  APIType.VpnDoLogin: "/do-login",
};

enum TcAPI { Login, GetBodyIndex, GetUnreadMsgCont, GetUnreadMsgList }
const TCAPIType = {
  TcAPI.Login: '/user/appLogin',
  TcAPI.GetBodyIndex: '/home/getBodyIndex',
  TcAPI.GetUnreadMsgCont: '/tidings/getUnreadMessageCont',
  TcAPI.GetUnreadMsgList: '/tidings/getTidingsList'
};

enum RunAPI {
  Login,
  DoLogin,
  GetStudent,
  GetExeRule,
  GetExeList,
  GetExeTimes,
  GetExeDetail,
}
const RUNAPIType = {
  RunAPI.Login: '/mobile/',
  RunAPI.DoLogin: '/service/login/mobile/check?vpn-12-o1-202.199.155.62:8080',
  RunAPI.GetExeRule:
      '/service/mobile/extExercise/findExeRule?vpn-12-o1-202.199.155.62:8080',
  RunAPI.GetExeList:
      '/service/mobile/extExercise/findExtExercise?vpn-12-o1-202.199.155.62:8080',
  RunAPI.GetExeTimes:
      '/service/mobile/extExercise/findExeTimes?vpn-12-o1-202.199.155.62:8080',
  RunAPI.GetExeDetail:
      '/service/mobile/extExercise/findExtExerciseDetail?vpn-12-o1-202.199.155.62:8080',
  RunAPI.GetStudent:'/service/sysUser/mobile/findStudent?vpn-12-o1-202.199.155.62:8080'
};

const Map<String, dynamic> httpHeaders = {
  'Accept': 'application/json,*/*',
  'Content-Type': 'application/json'
};

enum DioMethod { GET, POST, DELETE, PUT }
//使用：NWMethodValues[NWMethod.POST]
const DioMethodValues = {
  DioMethod.GET: "get",
  DioMethod.POST: "post",
  DioMethod.DELETE: "delete",
  DioMethod.PUT: "put"
};
