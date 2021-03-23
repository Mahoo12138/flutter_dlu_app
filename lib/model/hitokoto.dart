/// id : 3963
/// uuid : "8dba1467-7124-4a1e-95be-b5c2b212029b"
/// hitokoto : "我只是不想再失去他——哪怕是仅存在一瞬的幻影！"
/// type : "b"
/// from : "加油大魔王"
/// from_who : null
/// creator : "礼乐"
/// creator_uid : 2215
/// reviewer : 0
/// commit_from : "web"
/// created_at : "1540041044"
/// length : 23

class Hitokoto {
  int _id;
  String _uuid;
  String _hitokoto;
  String _type;
  String _from;
  dynamic _fromWho;
  String _creator;
  int _creatorUid;
  int _reviewer;
  String _commitFrom;
  String _createdAt;
  int _length;

  int get id => _id;
  String get uuid => _uuid;
  String get hitokoto => _hitokoto;
  String get type => _type;
  String get from => _from;
  dynamic get fromWho => _fromWho;
  String get creator => _creator;
  int get creatorUid => _creatorUid;
  int get reviewer => _reviewer;
  String get commitFrom => _commitFrom;
  String get createdAt => _createdAt;
  int get length => _length;

  Hitokoto({
      int id, 
      String uuid, 
      String hitokoto, 
      String type, 
      String from, 
      dynamic fromWho, 
      String creator, 
      int creatorUid, 
      int reviewer, 
      String commitFrom, 
      String createdAt, 
      int length}){
    _id = id;
    _uuid = uuid;
    _hitokoto = hitokoto;
    _type = type;
    _from = from;
    _fromWho = fromWho;
    _creator = creator;
    _creatorUid = creatorUid;
    _reviewer = reviewer;
    _commitFrom = commitFrom;
    _createdAt = createdAt;
    _length = length;
}

  Hitokoto.fromJson(dynamic json) {
    _id = json["id"];
    _uuid = json["uuid"];
    _hitokoto = json["hitokoto"];
    _type = json["type"];
    _from = json["from"];
    _fromWho = json["from_who"];
    _creator = json["creator"];
    _creatorUid = json["creator_uid"];
    _reviewer = json["reviewer"];
    _commitFrom = json["commit_from"];
    _createdAt = json["created_at"];
    _length = json["length"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["uuid"] = _uuid;
    map["hitokoto"] = _hitokoto;
    map["type"] = _type;
    map["from"] = _from;
    map["from_who"] = _fromWho;
    map["creator"] = _creator;
    map["creator_uid"] = _creatorUid;
    map["reviewer"] = _reviewer;
    map["commit_from"] = _commitFrom;
    map["created_at"] = _createdAt;
    map["length"] = _length;
    return map;
  }

}