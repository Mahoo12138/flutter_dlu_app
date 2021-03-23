/// classes : "化学191"
/// department : "环境与化学工程学院"
/// gender : "m"
/// is_passwd_upd : "1"
/// message : "登陆成功"
/// school_date : "2019-09-05"
/// status : "PASS"
/// std_number : "19412043"
/// token : "2487c67b828ff7bbd4eeafe8a05c2797a65c41cd"
/// user_fun : {"action_funs":["/mobile/appointment/searchRepealAppointmentList","/mobile/backlog/countMyRaces","/student/mobile/updateStudent","/common/mobile/saveFile","/mobile/extExercise/recalculate","/mobile/appointment/myGymSubject","/mobile/backlog/countStuMyAppointment","/mobile/raceInfo/selectUsedRaceInfos","/mobile/appointment/selectAppointmentByArea","test2","/mobile/appointment/selectStandardByScore","/mobile/appointment/selectMyAppointmentDetail","/mobile/appointment/deleteRepealAppointment","/mobile/extExercise/addDoubtsFeedback","/extExercise/mobile/selectStudentAllTags","/sysUser/mobile/revisePassword","/common/mobile/downloadFile","/appointment/mobile/selectAppointmentDetail","/code/mobile/searchCodeList","/mobile/backlog/deleteTODO","/mobile/extExercise/findExeRule","/mobile/appointment/selectAppointmentTimes","/mobile/raceInfo/delEnter","/mobile/raceInfo/findRaceItemAndEnter","/sysUser/mobile/findStudent","/mobile/extExercise/findExeTimes","/mobile/appointment/appointmentEnter","/mobile/raceInfo/studentEnter","/mobile/appointment/selectUserScore","/extExercise/mobile/selectStudentTags","/mobile/raceInfo/findStudent","/mobile/extExercise/saveAppeal","/mobile/raceInfo/studentsEnter","/raceInfo/mobile/selectList","/mobile/extExercise/findExtExercise","/mobile/raceInfo/myEnteredRaces","/raceInfo/mobile/raceDetail","/mobile/extExercise/findExtExerciseDetail","/mobile/raceInfo/myEnterItemDetail","/common/mobile/downloadFile","/mobile/appointment/selectMyAppointmentList","/homepage","/mobile/appointment/selectAppointmentList"],"element_funs":["/mobile/appointment/searchRepealAppointmentList","/mobile/backlog/countMyRaces","/student/mobile/updateStudent",null],"fun_urls":["/mobile/appointment/searchRepealAppointmentList","/mobile/backlog/countMyRaces","/student/mobile/updateStudent","/common/mobile/saveFile","/mobile/extExercise/recalculate","/mobile/appointment/myGymSubject","/mobile/backlog/countStuMyAppointment","/mobile/raceInfo/selectUsedRaceInfos","/mobile/appointment/selectAppointmentByArea","test2","/mobile/appointment/selectStandardByScore","/mobile/appointment/selectMyAppointmentDetail","/mobile/appointment/deleteRepealAppointment","/mobile/extExercise/addDoubtsFeedback","/extExercise/mobile/selectStudentAllTags","/sysUser/mobile/revisePassword","/common/mobile/downloadFile","/appointment/mobile/selectAppointmentDetail","/code/mobile/searchCodeList","/mobile/backlog/deleteTODO","/mobile/extExercise/findExeRule","/mobile/appointment/selectAppointmentTimes","/mobile/raceInfo/delEnter","/mobile/raceInfo/findRaceItemAndEnter","/sysUser/mobile/findStudent","/mobile/extExercise/findExeTimes","/mobile/appointment/appointmentEnter","/mobile/raceInfo/studentEnter","/mobile/appointment/selectUserScore","/extExercise/mobile/selectStudentTags","/mobile/raceInfo/findStudent","/mobile/extExercise/saveAppeal","/mobile/raceInfo/studentsEnter","/raceInfo/mobile/selectList","/mobile/extExercise/findExtExercise","/mobile/raceInfo/myEnteredRaces","/raceInfo/mobile/raceDetail","/mobile/extExercise/findExtExerciseDetail","/mobile/raceInfo/myEnterItemDetail","/common/mobile/downloadFile","/mobile/appointment/selectMyAppointmentList","/basicInformation","/homepage","/my","/compegrade","/mobile/appointment/selectAppointmentList","/competition","/mySubscribe","/morning","/testScore","/subscribe","/changePassword","footer/index","/QRCode","footer/* ","footer/subscribe","footer/my"],"view_funs":[{"children":[{"icon":"basicInformation.png","path":"/basicInformation","title":"基本信息"},{"icon":"myscore.png","path":"/compegrade","title":"赛事成绩"},{"icon":"notification.png","path":"/mySubscribe","title":"我的预约"},{"icon":"myscore.png","path":"/testScore","title":"体测成绩"},{"icon":"mybook.png","path":"/changePassword","title":"修改密码"},{"icon":"index_button.png","path":"footer/index","title":"首页"},{"icon":"codeIcon.png","path":"/QRCode","title":"体测二维码"},{"icon":"menu_button.png","path":"footer/* ","title":"成绩单"},{"icon":"book_button.png","path":"footer/subscribe","title":"预约"},{"icon":"person1.png","path":"footer/my","title":"我的"}],"dicorder":"10","icon":"","path":"/my","title":"个人中心"},{"dicorder":"20","icon":"race.png","path":"/competition","title":"赛事"},{"dicorder":"30","icon":"Morning.png","path":"/morning","title":"早操"},{"dicorder":"40","icon":"teascan.png","path":"/subscribe","title":"学生预约"}]}
/// user_id : "a36e2d55443f45adb234fa5c214945dc"
/// user_name : "罗西"

class UserInfo {
  String _classes;
  String _department;
  String _gender;
  String _isPasswdUpd;
  String _message;
  String _schoolDate;
  String _status;
  String _stdNumber;
  String _token;
  User_fun _userFun;
  String _userId;
  String _userName;

  String get classes => _classes;
  String get department => _department;
  String get gender => _gender;
  String get isPasswdUpd => _isPasswdUpd;
  String get message => _message;
  String get schoolDate => _schoolDate;
  String get status => _status;
  String get stdNumber => _stdNumber;
  String get token => _token;
  User_fun get userFun => _userFun;
  String get userId => _userId;
  String get userName => _userName;

  UserInfo({
      String classes, 
      String department, 
      String gender, 
      String isPasswdUpd, 
      String message, 
      String schoolDate, 
      String status, 
      String stdNumber, 
      String token, 
      User_fun userFun, 
      String userId, 
      String userName}){
    _classes = classes;
    _department = department;
    _gender = gender;
    _isPasswdUpd = isPasswdUpd;
    _message = message;
    _schoolDate = schoolDate;
    _status = status;
    _stdNumber = stdNumber;
    _token = token;
    _userFun = userFun;
    _userId = userId;
    _userName = userName;
}

  UserInfo.fromJson(dynamic json) {
    _classes = json["classes"];
    _department = json["department"];
    _gender = json["gender"];
    _isPasswdUpd = json["is_passwd_upd"];
    _message = json["message"];
    _schoolDate = json["school_date"];
    _status = json["status"];
    _stdNumber = json["std_number"];
    _token = json["token"];
    _userFun = json["user_fun"] != null ? User_fun.fromJson(json["user_fun"]) : null;
    _userId = json["user_id"];
    _userName = json["user_name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["classes"] = _classes;
    map["department"] = _department;
    map["gender"] = _gender;
    map["is_passwd_upd"] = _isPasswdUpd;
    map["message"] = _message;
    map["school_date"] = _schoolDate;
    map["status"] = _status;
    map["std_number"] = _stdNumber;
    map["token"] = _token;
    if (_userFun != null) {
      map["user_fun"] = _userFun.toJson();
    }
    map["user_id"] = _userId;
    map["user_name"] = _userName;
    return map;
  }

}

/// action_funs : ["/mobile/appointment/searchRepealAppointmentList","/mobile/backlog/countMyRaces","/student/mobile/updateStudent","/common/mobile/saveFile","/mobile/extExercise/recalculate","/mobile/appointment/myGymSubject","/mobile/backlog/countStuMyAppointment","/mobile/raceInfo/selectUsedRaceInfos","/mobile/appointment/selectAppointmentByArea","test2","/mobile/appointment/selectStandardByScore","/mobile/appointment/selectMyAppointmentDetail","/mobile/appointment/deleteRepealAppointment","/mobile/extExercise/addDoubtsFeedback","/extExercise/mobile/selectStudentAllTags","/sysUser/mobile/revisePassword","/common/mobile/downloadFile","/appointment/mobile/selectAppointmentDetail","/code/mobile/searchCodeList","/mobile/backlog/deleteTODO","/mobile/extExercise/findExeRule","/mobile/appointment/selectAppointmentTimes","/mobile/raceInfo/delEnter","/mobile/raceInfo/findRaceItemAndEnter","/sysUser/mobile/findStudent","/mobile/extExercise/findExeTimes","/mobile/appointment/appointmentEnter","/mobile/raceInfo/studentEnter","/mobile/appointment/selectUserScore","/extExercise/mobile/selectStudentTags","/mobile/raceInfo/findStudent","/mobile/extExercise/saveAppeal","/mobile/raceInfo/studentsEnter","/raceInfo/mobile/selectList","/mobile/extExercise/findExtExercise","/mobile/raceInfo/myEnteredRaces","/raceInfo/mobile/raceDetail","/mobile/extExercise/findExtExerciseDetail","/mobile/raceInfo/myEnterItemDetail","/common/mobile/downloadFile","/mobile/appointment/selectMyAppointmentList","/homepage","/mobile/appointment/selectAppointmentList"]
/// element_funs : ["/mobile/appointment/searchRepealAppointmentList","/mobile/backlog/countMyRaces","/student/mobile/updateStudent",null]
/// fun_urls : ["/mobile/appointment/searchRepealAppointmentList","/mobile/backlog/countMyRaces","/student/mobile/updateStudent","/common/mobile/saveFile","/mobile/extExercise/recalculate","/mobile/appointment/myGymSubject","/mobile/backlog/countStuMyAppointment","/mobile/raceInfo/selectUsedRaceInfos","/mobile/appointment/selectAppointmentByArea","test2","/mobile/appointment/selectStandardByScore","/mobile/appointment/selectMyAppointmentDetail","/mobile/appointment/deleteRepealAppointment","/mobile/extExercise/addDoubtsFeedback","/extExercise/mobile/selectStudentAllTags","/sysUser/mobile/revisePassword","/common/mobile/downloadFile","/appointment/mobile/selectAppointmentDetail","/code/mobile/searchCodeList","/mobile/backlog/deleteTODO","/mobile/extExercise/findExeRule","/mobile/appointment/selectAppointmentTimes","/mobile/raceInfo/delEnter","/mobile/raceInfo/findRaceItemAndEnter","/sysUser/mobile/findStudent","/mobile/extExercise/findExeTimes","/mobile/appointment/appointmentEnter","/mobile/raceInfo/studentEnter","/mobile/appointment/selectUserScore","/extExercise/mobile/selectStudentTags","/mobile/raceInfo/findStudent","/mobile/extExercise/saveAppeal","/mobile/raceInfo/studentsEnter","/raceInfo/mobile/selectList","/mobile/extExercise/findExtExercise","/mobile/raceInfo/myEnteredRaces","/raceInfo/mobile/raceDetail","/mobile/extExercise/findExtExerciseDetail","/mobile/raceInfo/myEnterItemDetail","/common/mobile/downloadFile","/mobile/appointment/selectMyAppointmentList","/basicInformation","/homepage","/my","/compegrade","/mobile/appointment/selectAppointmentList","/competition","/mySubscribe","/morning","/testScore","/subscribe","/changePassword","footer/index","/QRCode","footer/* ","footer/subscribe","footer/my"]
/// view_funs : [{"children":[{"icon":"basicInformation.png","path":"/basicInformation","title":"基本信息"},{"icon":"myscore.png","path":"/compegrade","title":"赛事成绩"},{"icon":"notification.png","path":"/mySubscribe","title":"我的预约"},{"icon":"myscore.png","path":"/testScore","title":"体测成绩"},{"icon":"mybook.png","path":"/changePassword","title":"修改密码"},{"icon":"index_button.png","path":"footer/index","title":"首页"},{"icon":"codeIcon.png","path":"/QRCode","title":"体测二维码"},{"icon":"menu_button.png","path":"footer/* ","title":"成绩单"},{"icon":"book_button.png","path":"footer/subscribe","title":"预约"},{"icon":"person1.png","path":"footer/my","title":"我的"}],"dicorder":"10","icon":"","path":"/my","title":"个人中心"},{"dicorder":"20","icon":"race.png","path":"/competition","title":"赛事"},{"dicorder":"30","icon":"Morning.png","path":"/morning","title":"早操"},{"dicorder":"40","icon":"teascan.png","path":"/subscribe","title":"学生预约"}]

class User_fun {
  List<String> _actionFuns;
  List<String> _elementFuns;
  List<String> _funUrls;
  List<View_funs> _viewFuns;

  List<String> get actionFuns => _actionFuns;
  List<String> get elementFuns => _elementFuns;
  List<String> get funUrls => _funUrls;
  List<View_funs> get viewFuns => _viewFuns;

  User_fun({
      List<String> actionFuns, 
      List<String> elementFuns, 
      List<String> funUrls, 
      List<View_funs> viewFuns}){
    _actionFuns = actionFuns;
    _elementFuns = elementFuns;
    _funUrls = funUrls;
    _viewFuns = viewFuns;
}

  User_fun.fromJson(dynamic json) {
    _actionFuns = json["action_funs"] != null ? json["action_funs"].cast<String>() : [];
    _elementFuns = json["element_funs"] != null ? json["element_funs"].cast<String>() : [];
    _funUrls = json["fun_urls"] != null ? json["fun_urls"].cast<String>() : [];
    if (json["view_funs"] != null) {
      _viewFuns = [];
      json["view_funs"].forEach((v) {
        _viewFuns.add(View_funs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["action_funs"] = _actionFuns;
    map["element_funs"] = _elementFuns;
    map["fun_urls"] = _funUrls;
    if (_viewFuns != null) {
      map["view_funs"] = _viewFuns.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// children : [{"icon":"basicInformation.png","path":"/basicInformation","title":"基本信息"},{"icon":"myscore.png","path":"/compegrade","title":"赛事成绩"},{"icon":"notification.png","path":"/mySubscribe","title":"我的预约"},{"icon":"myscore.png","path":"/testScore","title":"体测成绩"},{"icon":"mybook.png","path":"/changePassword","title":"修改密码"},{"icon":"index_button.png","path":"footer/index","title":"首页"},{"icon":"codeIcon.png","path":"/QRCode","title":"体测二维码"},{"icon":"menu_button.png","path":"footer/* ","title":"成绩单"},{"icon":"book_button.png","path":"footer/subscribe","title":"预约"},{"icon":"person1.png","path":"footer/my","title":"我的"}]
/// dicorder : "10"
/// icon : ""
/// path : "/my"
/// title : "个人中心"

class View_funs {
  List<Children> _children;
  String _dicorder;
  String _icon;
  String _path;
  String _title;

  List<Children> get children => _children;
  String get dicorder => _dicorder;
  String get icon => _icon;
  String get path => _path;
  String get title => _title;

  View_funs({
      List<Children> children, 
      String dicorder, 
      String icon, 
      String path, 
      String title}){
    _children = children;
    _dicorder = dicorder;
    _icon = icon;
    _path = path;
    _title = title;
}

  View_funs.fromJson(dynamic json) {
    if (json["children"] != null) {
      _children = [];
      json["children"].forEach((v) {
        _children.add(Children.fromJson(v));
      });
    }
    _dicorder = json["dicorder"];
    _icon = json["icon"];
    _path = json["path"];
    _title = json["title"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_children != null) {
      map["children"] = _children.map((v) => v.toJson()).toList();
    }
    map["dicorder"] = _dicorder;
    map["icon"] = _icon;
    map["path"] = _path;
    map["title"] = _title;
    return map;
  }

}

/// icon : "basicInformation.png"
/// path : "/basicInformation"
/// title : "基本信息"

class Children {
  String _icon;
  String _path;
  String _title;

  String get icon => _icon;
  String get path => _path;
  String get title => _title;

  Children({
      String icon, 
      String path, 
      String title}){
    _icon = icon;
    _path = path;
    _title = title;
}

  Children.fromJson(dynamic json) {
    _icon = json["icon"];
    _path = json["path"];
    _title = json["title"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["icon"] = _icon;
    map["path"] = _path;
    map["title"] = _title;
    return map;
  }

}