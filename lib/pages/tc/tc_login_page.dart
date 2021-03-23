import 'package:flutter/material.dart';
import 'package:flutter_dlu/common/route_config.dart';
import 'package:flutter_dlu/model/tc/login_info.dart';
import 'package:flutter_dlu/pages/tc/tc_utils.dart';
import 'package:flutter_dlu/utils/api_config.dart';
import 'package:flutter_dlu/utils/http_utils.dart';
import 'package:get/get.dart';

import '../account_config.dart';

// ignore: must_be_immutable
class TcLoginPage extends StatelessWidget {
  // final TcConfig tcConfig = Get.put(TcConfig());
  final AccountConfig accountConfig = Get.find();
  LoginInfo loginInfo;

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent.withOpacity(.9),
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox.fromSize(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('assets/tc_logo.png'),
                  ),
                  size: Size(100, 100),
                ),
                Text(
                  '体质监测',
                  style: TextStyle(fontSize: 25,color: Colors.deepOrange,decoration: TextDecoration.none  ),
                )
              ],
            ),
            flex: 2,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(50, 0, 50, 250),
              child: Card(
                color: Colors.greenAccent,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(35, 25, 35, 25),
                  child: Column(
                    children: [
                      Text(
                        "当前未登录",
                        style: TextStyle(
                            fontSize: 24, color: Colors.deepOrangeAccent),
                      ),
                      TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                            hintText: '输入密码', fillColor: Colors.red),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        scrollPadding: EdgeInsets.all(0),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return StatefulBuilder(
                                      builder: (context, state) {
                                        if (loginInfo == null) {
                                          _tcLogin(state);
                                        }
                                        return Dialog(
                                          child: _buildLoginDialog(),
                                        );
                                      });
                                });
                          },
                          style: ButtonStyle(
                              minimumSize:
                              MaterialStateProperty.all(Size(200, 50))),
                          child: Text('登录'))
                    ],
                  ),
                ),
              ),
            ),
            flex: 3,
          )
        ],
      ),
    );
  }

  _buildLoginDialog() {
    if (loginInfo!= null) {
      if (loginInfo.retmsg == "用户名或密码错误") {
        return Container(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("用户名或密码错误")],
          ),
        );
      } else {
        return Container(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.all(13),
                child: Text("登录成功！"),
              )
            ],
          ),
        );
      }
    } else {
      return Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(),
            ),
            Padding(
              padding: EdgeInsets.all(13),
              child: Text("登陆中"),
            )
          ],
        ),
      );
    }
  }

  void _tcLogin(state) async {
    var vt = TcUtils.getVT();
    // var vt = 681574;
    var param = {
      "common": {
        "version": "1.0",
        "platform": "android",
        "vt": vt,
        "uid": "",
        "token": ""
      },
      "req": {
        "user_account": "18422044",
        "pwd": TcUtils.getMD5Pwd(_controller.text)
      }
    };
    var sign = TcUtils.getReqSign(param, vt);
    // print("vt & sign: " + vt + "  " + sign);
    var myHeader = {
      'User-Agent': 'Mozilla/5.0 (Linux; Android 10; ONEPLUS A5000 Build/QKQ1.191014.012; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/88.0.4324.181 Mobile Safari/537.36',
      'Accept': 'application/json, text/plain, */*',
      'Accept-Language': 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7',
      'X-Requested-With': 'com.dlcvc.ecs',
      'Content-Type': 'application/json'
    };
    HttpUtils.post(
        APIs.tcUrl +
            TCAPIType[TcAPI.Login] +
            '?from=2&appId=1&vt=' +
            vt.toString() +
            '&sign=' +
            sign,
        param, headers:myHeader,success: (res) {
      // print(res);

      loginInfo = LoginInfo.fromJson(res);
      print(loginInfo.toJson());
      state(() {
        Get.back();
      });
      accountConfig.tcLogin(_controller.text, loginInfo);
      Get.offNamed(RouteConfig.tc);
    }, fail: (err) {
      print(err);
    });
  }
}
