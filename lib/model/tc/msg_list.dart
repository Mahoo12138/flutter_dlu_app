/// recordsFiltered : 35
/// recordsTotal : 35
/// reptime : 1616246112748
/// resp : {"inFoList":[{"content":"任务名：2021级体育学院预约 ,地点:体测中心 ,预约启动时间:2021-03-16 00:00:00","createTime":"2021/03/15 18:19:21","creator":4,"id":51,"read":true,"source":59,"status":1,"title":"开放日通知","type":1},{"content":"任务名：全心投入(周一至周五) ,地点:君健楼体育馆 ,预约启动时间:2021-01-03 15:46:41","createTime":"2021/01/03 15:49:27","creator":4,"id":50,"read":true,"source":58,"status":1,"title":"开放日通知","type":1},{"content":"任务名：百步穿杨(周五) ,地点:中心体育馆 ,预约启动时间:2021-01-03 15:45:43","createTime":"2021/01/03 15:47:16","creator":4,"id":49,"read":false,"source":57,"status":1,"title":"开放日通知","type":1},{"content":"任务名：百步穿杨(周三) ,地点:中心体育馆 ,预约启动时间:2021-01-03 15:45:00","createTime":"2021/01/03 15:46:31","creator":4,"id":48,"read":true,"source":56,"status":1,"title":"开放日通知","type":1},{"content":"任务名：百步穿杨(周一) ,地点:中心体育馆 ,预约启动时间:2021-01-03 15:44:15","createTime":"2021/01/03 15:45:51","creator":4,"id":47,"read":false,"source":55,"status":1,"title":"开放日通知","type":1},{"content":"任务名：冲上云霄(周五) ,地点:中心体育馆 ,预约启动时间:2021-01-03 15:41:09","createTime":"2021/01/03 15:42:53","creator":4,"id":46,"read":false,"source":54,"status":1,"title":"开放日通知","type":1},{"content":"任务名：冲上云霄(周三) ,地点:中心体育馆 ,预约启动时间:2021-01-03 15:40:20","createTime":"2021/01/03 15:41:58","creator":4,"id":45,"read":false,"source":53,"status":1,"title":"开放日通知","type":1},{"content":"任务名：冲上云霄(周一) ,地点:中心体育馆 ,预约启动时间:2021-01-03 15:39:28","createTime":"2021/01/03 15:40:59","creator":4,"id":44,"read":false,"source":52,"status":1,"title":"开放日通知","type":1},{"content":"任务名：二龙戏珠(周四) ,地点:君健楼体育馆 ,预约启动时间:2021-01-03 15:38:37","createTime":"2021/01/03 15:40:12","creator":4,"id":43,"read":false,"source":51,"status":1,"title":"开放日通知","type":1},{"content":"任务名：二龙戏珠（周二） ,地点:君健楼体育馆 ,预约启动时间:2021-01-03 15:37:40","createTime":"2021/01/03 15:39:23","creator":4,"id":42,"read":false,"source":50,"status":1,"title":"开放日通知","type":1},{"content":"任务名：一毽亲❤(周五) ,地点:君健楼体育馆 ,预约启动时间:2021-01-03 15:36:17","createTime":"2021/01/03 15:38:03","creator":4,"id":41,"read":false,"source":49,"status":1,"title":"开放日通知","type":1},{"content":"任务名：一毽亲❤(周二) ,地点:君健楼体育馆 ,预约启动时间:2021-01-03 15:35:14","createTime":"2021/01/03 15:37:03","creator":4,"id":40,"read":false,"source":48,"status":1,"title":"开放日通知","type":1},{"content":"任务名：一毽亲❤(周一) ,地点:君健楼体育馆 ,预约启动时间:2021-01-03 15:32:55","createTime":"2021/01/03 15:35:46","creator":4,"id":39,"read":false,"source":47,"status":1,"title":"开放日通知","type":1},{"content":"任务名：test2 ,地点:2 ,预约启动时间:2020-12-29 15:14:44","createTime":"2020/12/29 15:16:07","creator":4,"id":38,"read":false,"source":46,"status":1,"title":"开放日通知","type":1},{"content":"任务名：test1 ,地点:1 ,预约启动时间:2020-12-29 15:14:08","createTime":"2020/12/29 15:15:36","creator":4,"id":37,"read":false,"source":45,"status":1,"title":"开放日通知","type":1},{"content":"任务名：test2 ,地点:1 ,预约启动时间:2020-12-28 19:58:06","createTime":"2020/12/28 19:59:32","creator":4,"id":36,"read":false,"source":44,"status":1,"title":"开放日通知","type":1},{"content":"任务名：test1 ,地点:体测中心 ,预约启动时间:2020-12-28 19:57:26","createTime":"2020/12/28 19:58:59","creator":4,"id":35,"read":false,"source":43,"status":1,"title":"开放日通知","type":1},{"content":"任务名：体测 ,地点:体测中心 ,预约启动时间:2020-12-01 18:35:09","createTime":"2020/12/01 18:30:31","creator":4,"id":34,"read":false,"source":42,"status":1,"title":"开放日通知","type":1},{"content":"任务名：体成分2 ,地点:体测中心 ,预约启动时间:2020-12-08 16:30:25","createTime":"2020/12/01 18:24:21","creator":4,"id":33,"read":false,"source":41,"status":1,"title":"开放日通知","type":1},{"content":"任务名：体成分 ,地点:测试中心 ,预约启动时间:2020-12-01 17:07:06","createTime":"2020/12/01 17:00:32","creator":4,"id":32,"read":false,"source":40,"status":1,"title":"开放日通知","type":1}],"unreadCont":17}
/// retcode : "0"
/// retmsg : "请求成功"
/// vt : 713236


class MsgList {
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

  MsgList({
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

  MsgList.fromJson(dynamic json) {
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

/// inFoList : [{"content":"任务名：2021级体育学院预约 ,地点:体测中心 ,预约启动时间:2021-03-16 00:00:00","createTime":"2021/03/15 18:19:21","creator":4,"id":51,"read":true,"source":59,"status":1,"title":"开放日通知","type":1},{"content":"任务名：全心投入(周一至周五) ,地点:君健楼体育馆 ,预约启动时间:2021-01-03 15:46:41","createTime":"2021/01/03 15:49:27","creator":4,"id":50,"read":true,"source":58,"status":1,"title":"开放日通知","type":1},{"content":"任务名：百步穿杨(周五) ,地点:中心体育馆 ,预约启动时间:2021-01-03 15:45:43","createTime":"2021/01/03 15:47:16","creator":4,"id":49,"read":false,"source":57,"status":1,"title":"开放日通知","type":1},{"content":"任务名：百步穿杨(周三) ,地点:中心体育馆 ,预约启动时间:2021-01-03 15:45:00","createTime":"2021/01/03 15:46:31","creator":4,"id":48,"read":true,"source":56,"status":1,"title":"开放日通知","type":1},{"content":"任务名：百步穿杨(周一) ,地点:中心体育馆 ,预约启动时间:2021-01-03 15:44:15","createTime":"2021/01/03 15:45:51","creator":4,"id":47,"read":false,"source":55,"status":1,"title":"开放日通知","type":1},{"content":"任务名：冲上云霄(周五) ,地点:中心体育馆 ,预约启动时间:2021-01-03 15:41:09","createTime":"2021/01/03 15:42:53","creator":4,"id":46,"read":false,"source":54,"status":1,"title":"开放日通知","type":1},{"content":"任务名：冲上云霄(周三) ,地点:中心体育馆 ,预约启动时间:2021-01-03 15:40:20","createTime":"2021/01/03 15:41:58","creator":4,"id":45,"read":false,"source":53,"status":1,"title":"开放日通知","type":1},{"content":"任务名：冲上云霄(周一) ,地点:中心体育馆 ,预约启动时间:2021-01-03 15:39:28","createTime":"2021/01/03 15:40:59","creator":4,"id":44,"read":false,"source":52,"status":1,"title":"开放日通知","type":1},{"content":"任务名：二龙戏珠(周四) ,地点:君健楼体育馆 ,预约启动时间:2021-01-03 15:38:37","createTime":"2021/01/03 15:40:12","creator":4,"id":43,"read":false,"source":51,"status":1,"title":"开放日通知","type":1},{"content":"任务名：二龙戏珠（周二） ,地点:君健楼体育馆 ,预约启动时间:2021-01-03 15:37:40","createTime":"2021/01/03 15:39:23","creator":4,"id":42,"read":false,"source":50,"status":1,"title":"开放日通知","type":1},{"content":"任务名：一毽亲❤(周五) ,地点:君健楼体育馆 ,预约启动时间:2021-01-03 15:36:17","createTime":"2021/01/03 15:38:03","creator":4,"id":41,"read":false,"source":49,"status":1,"title":"开放日通知","type":1},{"content":"任务名：一毽亲❤(周二) ,地点:君健楼体育馆 ,预约启动时间:2021-01-03 15:35:14","createTime":"2021/01/03 15:37:03","creator":4,"id":40,"read":false,"source":48,"status":1,"title":"开放日通知","type":1},{"content":"任务名：一毽亲❤(周一) ,地点:君健楼体育馆 ,预约启动时间:2021-01-03 15:32:55","createTime":"2021/01/03 15:35:46","creator":4,"id":39,"read":false,"source":47,"status":1,"title":"开放日通知","type":1},{"content":"任务名：test2 ,地点:2 ,预约启动时间:2020-12-29 15:14:44","createTime":"2020/12/29 15:16:07","creator":4,"id":38,"read":false,"source":46,"status":1,"title":"开放日通知","type":1},{"content":"任务名：test1 ,地点:1 ,预约启动时间:2020-12-29 15:14:08","createTime":"2020/12/29 15:15:36","creator":4,"id":37,"read":false,"source":45,"status":1,"title":"开放日通知","type":1},{"content":"任务名：test2 ,地点:1 ,预约启动时间:2020-12-28 19:58:06","createTime":"2020/12/28 19:59:32","creator":4,"id":36,"read":false,"source":44,"status":1,"title":"开放日通知","type":1},{"content":"任务名：test1 ,地点:体测中心 ,预约启动时间:2020-12-28 19:57:26","createTime":"2020/12/28 19:58:59","creator":4,"id":35,"read":false,"source":43,"status":1,"title":"开放日通知","type":1},{"content":"任务名：体测 ,地点:体测中心 ,预约启动时间:2020-12-01 18:35:09","createTime":"2020/12/01 18:30:31","creator":4,"id":34,"read":false,"source":42,"status":1,"title":"开放日通知","type":1},{"content":"任务名：体成分2 ,地点:体测中心 ,预约启动时间:2020-12-08 16:30:25","createTime":"2020/12/01 18:24:21","creator":4,"id":33,"read":false,"source":41,"status":1,"title":"开放日通知","type":1},{"content":"任务名：体成分 ,地点:测试中心 ,预约启动时间:2020-12-01 17:07:06","createTime":"2020/12/01 17:00:32","creator":4,"id":32,"read":false,"source":40,"status":1,"title":"开放日通知","type":1}]
/// unreadCont : 17

class Resp {
  List<InFoList> _inFoList;
  int _unreadCont;

  List<InFoList> get inFoList => _inFoList;
  int get unreadCont => _unreadCont;

  Resp({
      List<InFoList> inFoList, 
      int unreadCont}){
    _inFoList = inFoList;
    _unreadCont = unreadCont;
}

  Resp.fromJson(dynamic json) {
    if (json["inFoList"] != null) {
      _inFoList = [];
      json["inFoList"].forEach((v) {
        _inFoList.add(InFoList.fromJson(v));
      });
    }
    _unreadCont = json["unreadCont"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_inFoList != null) {
      map["inFoList"] = _inFoList.map((v) => v.toJson()).toList();
    }
    map["unreadCont"] = _unreadCont;
    return map;
  }

}

/// content : "任务名：2021级体育学院预约 ,地点:体测中心 ,预约启动时间:2021-03-16 00:00:00"
/// createTime : "2021/03/15 18:19:21"
/// creator : 4
/// id : 51
/// read : true
/// source : 59
/// status : 1
/// title : "开放日通知"
/// type : 1

class InFoList {
  String _content;
  String _createTime;
  int _creator;
  int _id;
  bool _read;
  int _source;
  int _status;
  String _title;
  int _type;

  String get content => _content;
  String get createTime => _createTime;
  int get creator => _creator;
  int get id => _id;
  bool get read => _read;
  int get source => _source;
  int get status => _status;
  String get title => _title;
  int get type => _type;

  InFoList({
      String content, 
      String createTime, 
      int creator, 
      int id, 
      bool read, 
      int source, 
      int status, 
      String title, 
      int type}){
    _content = content;
    _createTime = createTime;
    _creator = creator;
    _id = id;
    _read = read;
    _source = source;
    _status = status;
    _title = title;
    _type = type;
}

  InFoList.fromJson(dynamic json) {
    _content = json["content"];
    _createTime = json["createTime"];
    _creator = json["creator"];
    _id = json["id"];
    _read = json["read"];
    _source = json["source"];
    _status = json["status"];
    _title = json["title"];
    _type = json["type"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["content"] = _content;
    map["createTime"] = _createTime;
    map["creator"] = _creator;
    map["id"] = _id;
    map["read"] = _read;
    map["source"] = _source;
    map["status"] = _status;
    map["title"] = _title;
    map["type"] = _type;
    return map;
  }

}