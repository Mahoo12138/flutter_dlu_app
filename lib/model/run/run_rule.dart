/// amId : "7b51c6df5aef4f32984486ef83094410"
/// am_end_time : "07:30:00"
/// am_require_distance : "2800"
/// am_require_time : "00:30:00"
/// am_start_time : "05:55:00"
/// isRun : "1"
/// message : "获取信息成功"
/// pmId : "51d7d241f6c045a78efd3c0763ec943b"
/// pm_end_time : "19:00:00"
/// pm_require_distance : "3200"
/// pm_require_time : "00:30:00"
/// pm_start_time : "16:55:00"
/// ruleMsg : "05:55:00~07:30:00和16:55:00~19:00:00。要求沿操场进行跑圈，必须踩到起点和终点的计时设备，规定时间：00:30:00分钟以内跑满3200/2800米即为合格。"
/// status : "PASS"
/// tag_number : "0580a02a6d3e"

class RunRule {
  String _amId;
  String _amEndTime;
  String _amRequireDistance;
  String _amRequireTime;
  String _amStartTime;
  String _isRun;
  String _message;
  String _pmId;
  String _pmEndTime;
  String _pmRequireDistance;
  String _pmRequireTime;
  String _pmStartTime;
  String _ruleMsg;
  String _status;
  String _tagNumber;

  String get amId => _amId;
  String get amEndTime => _amEndTime;
  String get amRequireDistance => _amRequireDistance;
  String get amRequireTime => _amRequireTime;
  String get amStartTime => _amStartTime;
  String get isRun => _isRun;
  String get message => _message;
  String get pmId => _pmId;
  String get pmEndTime => _pmEndTime;
  String get pmRequireDistance => _pmRequireDistance;
  String get pmRequireTime => _pmRequireTime;
  String get pmStartTime => _pmStartTime;
  String get ruleMsg => _ruleMsg;
  String get status => _status;
  String get tagNumber => _tagNumber;

  RunRule({
      String amId, 
      String amEndTime, 
      String amRequireDistance, 
      String amRequireTime, 
      String amStartTime, 
      String isRun, 
      String message, 
      String pmId, 
      String pmEndTime, 
      String pmRequireDistance, 
      String pmRequireTime, 
      String pmStartTime, 
      String ruleMsg, 
      String status, 
      String tagNumber}){
    _amId = amId;
    _amEndTime = amEndTime;
    _amRequireDistance = amRequireDistance;
    _amRequireTime = amRequireTime;
    _amStartTime = amStartTime;
    _isRun = isRun;
    _message = message;
    _pmId = pmId;
    _pmEndTime = pmEndTime;
    _pmRequireDistance = pmRequireDistance;
    _pmRequireTime = pmRequireTime;
    _pmStartTime = pmStartTime;
    _ruleMsg = ruleMsg;
    _status = status;
    _tagNumber = tagNumber;
}

  RunRule.fromJson(dynamic json) {
    _amId = json["amId"];
    _amEndTime = json["am_end_time"];
    _amRequireDistance = json["am_require_distance"];
    _amRequireTime = json["am_require_time"];
    _amStartTime = json["am_start_time"];
    _isRun = json["isRun"];
    _message = json["message"];
    _pmId = json["pmId"];
    _pmEndTime = json["pm_end_time"];
    _pmRequireDistance = json["pm_require_distance"];
    _pmRequireTime = json["pm_require_time"];
    _pmStartTime = json["pm_start_time"];
    _ruleMsg = json["ruleMsg"];
    _status = json["status"];
    _tagNumber = json["tag_number"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["amId"] = _amId;
    map["am_end_time"] = _amEndTime;
    map["am_require_distance"] = _amRequireDistance;
    map["am_require_time"] = _amRequireTime;
    map["am_start_time"] = _amStartTime;
    map["isRun"] = _isRun;
    map["message"] = _message;
    map["pmId"] = _pmId;
    map["pm_end_time"] = _pmEndTime;
    map["pm_require_distance"] = _pmRequireDistance;
    map["pm_require_time"] = _pmRequireTime;
    map["pm_start_time"] = _pmStartTime;
    map["ruleMsg"] = _ruleMsg;
    map["status"] = _status;
    map["tag_number"] = _tagNumber;
    return map;
  }

}