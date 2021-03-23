import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dlu/pages/account_config.dart';
import 'package:flutter_dlu/utils/api_config.dart';
import 'package:flutter_dlu/utils/http_utils.dart';
import 'package:flutter_dlu/utils/run_secret.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RunPageInfo extends StatefulWidget {
  @override
  _RunPageInfoState createState() => _RunPageInfoState();
}

class _RunPageInfoState extends State<RunPageInfo> {
  AccountConfig _accountConfig = Get.find();
  List<String> userInfo;
  @override
  void initState() {
    print("initState");
    // 获取用户信息
    _getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基本信息'),
      ),
      body: Column(
        children: [
          Flexible(
            child: Container(
              width: double.infinity,
              color: Colors.lightBlue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 115.0,
                    height: 115.0,
                    child: CircleAvatar(
                        backgroundColor: Colors.deepPurpleAccent,
                        backgroundImage: AssetImage('assets/avatar.png')),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                    child: Text(
                      userInfo == null ? '未知' : userInfo[3],
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  )
                ],
              ),
            ),
            flex: 1,
          ),
          Flexible(
            child: Column(
              children: [
                _myListTile('学号', value: userInfo == null ? '无' : userInfo[2]),
                _myListTile('班级', value: userInfo == null ? '无' : userInfo[0]),
                _myListTile('学院', value: userInfo == null ? '无' : userInfo[1]),
                _myListTile('电话',value:'无'),
                _myListTile('邮箱',value:'无'),
                _myListTile('QQ',value:'无'),
                _myListTile('最大心率',value:'无'),
              ],
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _myListTile(String title, {String value}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: ListTile(
          leading: Icon(Icons.blur_circular),
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(title),
            Text(
              value,
              style: TextStyle(color: Colors.grey),
            ),
          ]),
          trailing: Icon(Icons.arrow_right)),
    );
  }

  _getUserInfo() async {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // userInfo = preferences.getStringList('UserInfo');
    var param = {
      'userId': _accountConfig.runUserInfo.value.userId
    };
    var signKey =
    sha1.convert(utf8.encode(sortAsc(param))).toString().toUpperCase();
    param['sign'] = signKey;

    HttpUtils.post(APIs.runUrl + RUNAPIType[RunAPI.GetStudent], param,success: (res){
      print(res);
    });
    print("UserInfo" + userInfo.toString());
    setState(() {});
  }
}
