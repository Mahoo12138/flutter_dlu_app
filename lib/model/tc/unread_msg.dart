/// recordsFiltered : 0
/// recordsTotal : 0
/// reptime : 1616225509477
/// resp : {"unreadCont":32}
/// retcode : "0"
/// retmsg : "请求成功"
/// vt : 662699

class UnreadMsg {
  int _recordsFiltered;
  int _recordsTotal;
  int _reptime;
  Resp _resp;
  String _retcode;
  String _retmsg;
  int _vt;

  int get recordsFiltered => _recordsFiltered;
  int get recordsTotal => _recordsTotal;
  int get reptime => _reptime;
  Resp get resp => _resp;
  String get retcode => _retcode;
  String get retmsg => _retmsg;
  int get vt => _vt;

  UnreadMsg({
      int recordsFiltered, 
      int recordsTotal, 
      int reptime, 
      Resp resp, 
      String retcode, 
      String retmsg, 
      int vt}){
    _recordsFiltered = recordsFiltered;
    _recordsTotal = recordsTotal;
    _reptime = reptime;
    _resp = resp;
    _retcode = retcode;
    _retmsg = retmsg;
    _vt = vt;
}

  UnreadMsg.fromJson(dynamic json) {
    _recordsFiltered = json["recordsFiltered"];
    _recordsTotal = json["recordsTotal"];
    _reptime = json["reptime"];
    _resp = json["resp"] != null ? Resp.fromJson(json["resp"]) : null;
    _retcode = json["retcode"];
    _retmsg = json["retmsg"];
    _vt = json["vt"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["recordsFiltered"] = _recordsFiltered;
    map["recordsTotal"] = _recordsTotal;
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

/// unreadCont : 32

class Resp {
  int _unreadCont;

  int get unreadCont => _unreadCont;

  Resp({
      int unreadCont}){
    _unreadCont = unreadCont;
}

  Resp.fromJson(dynamic json) {
    _unreadCont = json["unreadCont"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["unreadCont"] = _unreadCont;
    return map;
  }

}