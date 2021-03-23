import 'package:flutter_dlu/model/tc/login_info.dart';
import 'package:get/get.dart';

class AccountConfig extends GetxController {
  final accountInfo = AccountInfo().obs;

  final tcUserInfo = TcUserInfo().obs;

  final runUserInfo = RunUserInfo().obs;

  void vpnLogin(int id, String psw) {
    accountInfo.update((val) {
      val.stuId = id;
      val.vpnPsw = psw;
    });
  }

  void runLogin(psw,token,id) {
    accountInfo.update((val) {
      val.runPsw = psw;
    });
    this.runUserInfo.update((val) {
      val.userId = id;
      val.token = token;
    });
  }

  void tcLogin(psw, LoginInfo loginInfo) {
    accountInfo.update((val) {
      val.tcPsw = psw;
    });

    tcUserInfo.update((user) {
      // 这个参数是你要更新的类本身。
      print(loginInfo.toString());
      user.nick = loginInfo.resp.nick;
      // print("查看是否赋值：${user.nick}");
      user.uid = loginInfo.resp.uid;
      user.token = loginInfo.resp.token;
      user.saltKey = loginInfo.resp.saltKey;
    });
  }
}

class AccountInfo {
  AccountInfo({
    int stuId,
    String vpnPsw,
    String runPsw,
    String tcPsw,
  });
  int stuId;
  String vpnPsw;
  String runPsw;
  String tcPsw;
}

class TcUserInfo {
  TcUserInfo(
      {this.uid = 0,
      this.token = '',
      this.saltKey = '',
      this.picture = '',
      this.account = 0,
      this.productType = 0,
      this.nick = '',
      this.sex = '',
      this.department = ''});
  int uid;
  String token;
  String saltKey;
  String picture;
  int account;
  int productType;
  String nick;
  String sex;
  String department;
}

class RunUserInfo {
  RunUserInfo({
    token = '',
    userId = '',
  });
  String token;
  String userId;
}
