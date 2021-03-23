/// reptime : 1615820563586
/// resp : {"account":"18422044","department":"信息工程学院","expired":1617116563538,"lastLoginTime":"2021/03/15 11:16:41","nick":"黄昌河","saltKey":"3809c139344a42e2f97f0c1051e80e4a","sex":1,"token":"b9fa0b2ae48bba5117ef1c73fb284f03","uid":8593,"updatePaw":0,"updateSurvey":2,"userType":2}
/// retcode : "0"
/// retmsg : "请求成功"
/// vt : 26906

class LoginInfo {
  int _reptime;
  Resp _resp;
  String _retcode;
  String _retmsg;
  int _vt;

  int get reptime => _reptime;
  Resp get resp => _resp;
  String get retcode => _retcode;
  String get retmsg => _retmsg;
  int get vt => _vt;

  LoginInfo({
      int reptime, 
      Resp resp, 
      String retcode, 
      String retmsg, 
      int vt}){
    _reptime = reptime;
    _resp = resp;
    _retcode = retcode;
    _retmsg = retmsg;
    _vt = vt;
}

  LoginInfo.fromJson(dynamic json) {
    _reptime = json["reptime"];
    _resp = json["resp"] != null ? Resp.fromJson(json["resp"]) : null;
    _retcode = json["retcode"];
    _retmsg = json["retmsg"];
    _vt = json["vt"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["reptime"] = _reptime;
    if (_resp != null) {
      map["resp"] = _resp.toJson();
    }
    map["retcode"] = _retcode;
    map["retmsg"] = _retmsg;
    map["vt"] = _vt;
    return map;
  }

}

/// account : "18422044"
/// department : "信息工程学院"
/// expired : 1617116563538
/// lastLoginTime : "2021/03/15 11:16:41"
/// nick : "黄昌河"
/// saltKey : "3809c139344a42e2f97f0c1051e80e4a"
/// sex : 1
/// token : "b9fa0b2ae48bba5117ef1c73fb284f03"
/// uid : 8593
/// updatePaw : 0
/// updateSurvey : 2
/// userType : 2

class Resp {
  String _account;
  String _department;
  int _expired;
  String _lastLoginTime;
  String _nick;
  String _saltKey;
  int _sex;
  String _token;
  int _uid;
  int _updatePaw;
  int _updateSurvey;
  int _userType;

  String get account => _account;
  String get department => _department;
  int get expired => _expired;
  String get lastLoginTime => _lastLoginTime;
  String get nick => _nick;
  String get saltKey => _saltKey;
  int get sex => _sex;
  String get token => _token;
  int get uid => _uid;
  int get updatePaw => _updatePaw;
  int get updateSurvey => _updateSurvey;
  int get userType => _userType;

  Resp({
      String account, 
      String department, 
      int expired, 
      String lastLoginTime, 
      String nick, 
      String saltKey, 
      int sex, 
      String token, 
      int uid, 
      int updatePaw, 
      int updateSurvey, 
      int userType}){
    _account = account;
    _department = department;
    _expired = expired;
    _lastLoginTime = lastLoginTime;
    _nick = nick;
    _saltKey = saltKey;
    _sex = sex;
    _token = token;
    _uid = uid;
    _updatePaw = updatePaw;
    _updateSurvey = updateSurvey;
    _userType = userType;
}

  Resp.fromJson(dynamic json) {
    _account = json["account"];
    _department = json["department"];
    _expired = json["expired"];
    _lastLoginTime = json["lastLoginTime"];
    _nick = json["nick"];
    _saltKey = json["saltKey"];
    _sex = json["sex"];
    _token = json["token"];
    _uid = json["uid"];
    _updatePaw = json["updatePaw"];
    _updateSurvey = json["updateSurvey"];
    _userType = json["userType"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["account"] = _account;
    map["department"] = _department;
    map["expired"] = _expired;
    map["lastLoginTime"] = _lastLoginTime;
    map["nick"] = _nick;
    map["saltKey"] = _saltKey;
    map["sex"] = _sex;
    map["token"] = _token;
    map["uid"] = _uid;
    map["updatePaw"] = _updatePaw;
    map["updateSurvey"] = _updateSurvey;
    map["userType"] = _userType;
    return map;
  }

}