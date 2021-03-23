/// reason : "查询成功!"
/// result : {"city":"大连","realtime":{"temperature":"8","humidity":"39","info":"晴","wid":"00","direct":"南风","power":"4级","aqi":"147"},"future":[{"date":"2021-02-27","temperature":"3/10℃","weather":"晴转多云","wid":{"day":"00","night":"01"},"direct":"南风"},{"date":"2021-02-28","temperature":"0/8℃","weather":"小雨转雨夹雪","wid":{"day":"07","night":"06"},"direct":"东南风转北风"},{"date":"2021-03-01","temperature":"-4/0℃","weather":"小到中雪转多云","wid":{"day":"26","night":"01"},"direct":"北风"},{"date":"2021-03-02","temperature":"-3/0℃","weather":"晴","wid":{"day":"00","night":"00"},"direct":"北风转南风"},{"date":"2021-03-03","temperature":"3/8℃","weather":"晴","wid":{"day":"00","night":"00"},"direct":"南风"}]}
/// error_code : 0

class Weather {
  String _reason;
  Result _result;
  int _errorCode;

  String get reason => _reason;
  Result get result => _result;
  int get errorCode => _errorCode;

  Weather({
      String reason, 
      Result result, 
      int errorCode}){
    _reason = reason;
    _result = result;
    _errorCode = errorCode;
}

  Weather.fromJson(dynamic json) {
    _reason = json["reason"];
    _result = json["result"] != null ? Result.fromJson(json["result"]) : null;
    _errorCode = json["error_code"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["reason"] = _reason;
    if (_result != null) {
      map["result"] = _result.toJson();
    }
    map["error_code"] = _errorCode;
    return map;
  }

}

/// city : "大连"
/// realtime : {"temperature":"8","humidity":"39","info":"晴","wid":"00","direct":"南风","power":"4级","aqi":"147"}
/// future : [{"date":"2021-02-27","temperature":"3/10℃","weather":"晴转多云","wid":{"day":"00","night":"01"},"direct":"南风"},{"date":"2021-02-28","temperature":"0/8℃","weather":"小雨转雨夹雪","wid":{"day":"07","night":"06"},"direct":"东南风转北风"},{"date":"2021-03-01","temperature":"-4/0℃","weather":"小到中雪转多云","wid":{"day":"26","night":"01"},"direct":"北风"},{"date":"2021-03-02","temperature":"-3/0℃","weather":"晴","wid":{"day":"00","night":"00"},"direct":"北风转南风"},{"date":"2021-03-03","temperature":"3/8℃","weather":"晴","wid":{"day":"00","night":"00"},"direct":"南风"}]

class Result {
  String _city;
  Realtime _realtime;
  List<Future> _future;

  String get city => _city;
  Realtime get realtime => _realtime;
  List<Future> get future => _future;

  Result({
      String city, 
      Realtime realtime, 
      List<Future> future}){
    _city = city;
    _realtime = realtime;
    _future = future;
}

  Result.fromJson(dynamic json) {
    _city = json["city"];
    _realtime = json["realtime"] != null ? Realtime.fromJson(json["realtime"]) : null;
    if (json["future"] != null) {
      _future = [];
      json["future"].forEach((v) {
        _future.add(Future.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["city"] = _city;
    if (_realtime != null) {
      map["realtime"] = _realtime.toJson();
    }
    if (_future != null) {
      map["future"] = _future.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// date : "2021-02-27"
/// temperature : "3/10℃"
/// weather : "晴转多云"
/// wid : {"day":"00","night":"01"}
/// direct : "南风"

class Future {
  String _date;
  String _temperature;
  String _weather;
  Wid _wid;
  String _direct;

  String get date => _date;
  String get temperature => _temperature;
  String get weather => _weather;
  Wid get wid => _wid;
  String get direct => _direct;

  Future({
      String date, 
      String temperature, 
      String weather, 
      Wid wid, 
      String direct}){
    _date = date;
    _temperature = temperature;
    _weather = weather;
    _wid = wid;
    _direct = direct;
}

  Future.fromJson(dynamic json) {
    _date = json["date"];
    _temperature = json["temperature"];
    _weather = json["weather"];
    _wid = json["wid"] != null ? Wid.fromJson(json["wid"]) : null;
    _direct = json["direct"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["date"] = _date;
    map["temperature"] = _temperature;
    map["weather"] = _weather;
    if (_wid != null) {
      map["wid"] = _wid.toJson();
    }
    map["direct"] = _direct;
    return map;
  }

}

/// day : "00"
/// night : "01"

class Wid {
  String _day;
  String _night;

  String get day => _day;
  String get night => _night;

  Wid({
      String day, 
      String night}){
    _day = day;
    _night = night;
}

  Wid.fromJson(dynamic json) {
    _day = json["day"];
    _night = json["night"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["day"] = _day;
    map["night"] = _night;
    return map;
  }

}

/// temperature : "8"
/// humidity : "39"
/// info : "晴"
/// wid : "00"
/// direct : "南风"
/// power : "4级"
/// aqi : "147"

class Realtime {
  String _temperature;
  String _humidity;
  String _info;
  String _wid;
  String _direct;
  String _power;
  String _aqi;

  String get temperature => _temperature;
  String get humidity => _humidity;
  String get info => _info;
  String get wid => _wid;
  String get direct => _direct;
  String get power => _power;
  String get aqi => _aqi;

  Realtime({
      String temperature, 
      String humidity, 
      String info, 
      String wid, 
      String direct, 
      String power, 
      String aqi}){
    _temperature = temperature;
    _humidity = humidity;
    _info = info;
    _wid = wid;
    _direct = direct;
    _power = power;
    _aqi = aqi;
}

  Realtime.fromJson(dynamic json) {
    _temperature = json["temperature"];
    _humidity = json["humidity"];
    _info = json["info"];
    _wid = json["wid"];
    _direct = json["direct"];
    _power = json["power"];
    _aqi = json["aqi"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["temperature"] = _temperature;
    map["humidity"] = _humidity;
    map["info"] = _info;
    map["wid"] = _wid;
    map["direct"] = _direct;
    map["power"] = _power;
    map["aqi"] = _aqi;
    return map;
  }

}