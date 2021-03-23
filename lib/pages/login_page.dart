import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dlu/common/route_config.dart';
import 'package:flutter_dlu/pages/account_config.dart';
import 'package:flutter_dlu/utils/api_config.dart';
import 'package:flutter_dlu/utils/http_utils.dart';
import 'package:flutter_dlu/widget/loadingButton.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoadingButtonController _buttonController = LoadingButtonController();
  // AccountConfig accountConfig = Get.find();
  final AccountConfig accountConfig = Get.put(AccountConfig());

  void _doLogin() async {
    print(pswController.text);
    accountConfig.accountInfo.value.stuId = 18422044;

    RegExp exp = new RegExp(r"captcha/[0-9a-zA-Z_]*.png");

    HttpUtils.getRequest(APIType.VpnLogin, success: (res) {
      // print("发送get请求！" + 'imgID ：');
      if (exp.firstMatch(res) != null) {
        String captcha = exp.firstMatch(res).group(0).substring(8, 23);
        // print(captcha);
        Map<String, dynamic> myData = {
          'username': '18422044',
          'password': "026752",
          'auth_type': 'local',
          'needCaptcha': 'false',
          'captcha_id': captcha,
          'sms_code': '',
          'captcha': ''
        };

        HttpUtils.postRequest(APIType.VpnDoLogin, myData, success: (res) {
          // print("登录VPN："+res.toString());
          if (res.toString().contains('true')) {
            _buttonController.success();
            print("VPN 登录成功！");
            Navigator.of(context).pushNamed('/home');
          } else {
            _buttonController.error();
            print("VPN 登录失败！");
          }
        });
      } else {
        print("已登录！");
        // Navigator.of(context).pushReplacementNamed('/home');
        Get.to(RouteConfig.home);
      }
    });
  }

  final stuController = TextEditingController();
  final pswController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueGrey, Colors.lightBlueAccent]),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 60, left: 10, right: 20),
                    child: RotatedBox(
                        quarterTurns: -1,
                        child: Text(
                          '登录',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.w900,
                          ),
                        )),
                  ),
                  Container(
                    //color: Colors.green,
                    height: 200,
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 100,
                        ),
                        Text(
                          '连大生活+',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '你的大学生活助手！',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
                // 学号输入框
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      controller: stuController,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                      ],
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 2),
                        fillColor: Colors.lightBlueAccent,
                        labelText: '学号',
                        labelStyle: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      controller: pswController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 2),
                        border: InputBorder.none,
                        labelText: '密码',
                        labelStyle: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, right: 50, left: 200),
                  child: Container(
                      alignment: Alignment.bottomRight,
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue[300],
                            blurRadius:
                                10.0, // has the effect of softening the shadow
                            spreadRadius:
                                1.0, // has the effect of extending the shadow
                            offset: Offset(
                              5.0, // horizontal, move right 10
                              5.0, // vertical, move down 10
                            ),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: LoadingButton(
                        controller: _buttonController,
                        onPressed: _doLogin,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 30),
                  child: Container(
                    alignment: Alignment.topRight,
                    //color: Colors.red,
                    height: 20,
                    child: Row(
                      children: <Widget>[
                        Text(
                          '忘记密码？',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white70,
                          ),
                        ),
                        Text('身份证号后六位！',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
