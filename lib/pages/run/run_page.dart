import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dlu/common/route_config.dart';
import 'package:flutter_dlu/pages/run/run_histroy.dart';
import 'package:flutter_dlu/pages/run/run_today.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_dlu/model/run/user_info.dart';
import 'package:flutter_dlu/utils/api_config.dart';
import 'package:flutter_dlu/utils/http_utils.dart';
import 'package:flutter_dlu/utils/run_secret.dart';

import '../account_config.dart';

class RunPage extends StatefulWidget {
  @override
  _RunPageState createState() => _RunPageState();
}

class _RunPageState extends State<RunPage> with TickerProviderStateMixin {
  TabController _tabController;
  UserInfo _userInfo;
  AccountConfig _accountConfig = Get.find();
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _runLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      appBar: AppBar(
        title: Text("连大智慧校园"),
        bottom: TabBar(
          unselectedLabelColor: Colors.grey.shade400,
          labelColor: Colors.white,
          controller: _tabController,
          tabs: [
            Tab(
              text: "课外锻炼",
            ),
            Tab(
              text: "考勤详情",
            ),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.home), onPressed: (){
            Get.offAll(RouteConfig.home);
          })
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
              child: Center(
                child: SizedBox(
                  width:85.0,
                  height: 85.0,
                  child: CircleAvatar(
                    child: Text('R'),
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: () {Navigator.of(context).pushNamed( '/run/info');},
              leading: Icon(Icons.person_rounded),
              title: Text('基本信息'),
              trailing: Icon(Icons.chevron_right_outlined),
            ),
            ListTile(
              onTap: () {
                Get.back();
              },
              leading: Icon(Icons.calendar_view_day_outlined),
              title: Text('赛事成绩'),
              trailing: Icon(Icons.chevron_right_outlined),
            ),
            ListTile(
              onTap: () {
                Get.back();
              },
              leading: Icon(Icons.library_books),
              title: Text('我的预约'),
              trailing: Icon(Icons.chevron_right_outlined),
            ),
            ListTile(
              onTap: () {
                Get.back();
              },
              leading: Icon(Icons.calendar_view_day),
              title: Text('体测成绩'),
              trailing: Icon(Icons.chevron_right_outlined),
            ),
            ListTile(
              onTap: () {
                Get.back();
              },
              leading: Icon(Icons.vpn_key_outlined),
              title: Text('修改密码'),
              trailing: Icon(Icons.chevron_right_outlined),
            ),
            ListTile(
              onTap: () {
                Get.back();
                Get.toNamed(RouteConfig.runQR);
              },
              leading: Icon(Icons.qr_code_scanner_outlined),
              title: Text('体测二维码'),
              trailing: Icon(Icons.chevron_right_outlined),
            ),
            ListTile(
              onTap: () {
                Get.back();
              },
              leading: Icon(Icons.settings),
              title: Text('设置'),
              trailing: Icon(Icons.chevron_right_outlined),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: TodayPage(),
          ),
          HistoryPage(),
        ],
      ),
    );
  }

  _runLogin() {
    var bytes = utf8.encode("111111"); // data being hashed
    var psw = md5.convert(bytes).toString();
    Map<String, dynamic> data = {
      "username": "19412043",
      "password": psw,
      "sys_id": "iscpMobile",
    };
    var signKey =
    sha1.convert(utf8.encode(sortAsc(data))).toString().toUpperCase();
    data['sign'] = signKey;
    HttpUtils.post(APIs.runUrl + RUNAPIType[RunAPI.DoLogin], data, success: (res) async{
      print("尝试登录："+ res.toString());
      if(res.toString().contains('禁用')){
        Get.defaultDialog(
            title: '提示信息',
            content: Padding(padding: EdgeInsets.all(12),child: Text("用户被禁用"),),
            cancel: TextButton(onPressed: (){
              Get.back();
              Get.back();
            },child: Text('确定'),)
        );
      }
      else if(res.toString().contains('密码不正确')){
        Get.defaultDialog(
            title: '提示信息',
            content: Padding(padding: EdgeInsets.all(12),child: Text("密码不正确"),),
            cancel: TextButton(onPressed: (){
              Get.back();
              Get.back();
            },child: Text('确定'),)
        );
      }
      else{
        _userInfo = UserInfo.fromJson(res);
        _accountConfig.runLogin('111111',_userInfo.token,_userInfo.userId);

        SharedPreferences preferences =  await SharedPreferences.getInstance();
        preferences.setStringList('UserInfo', <String>[_userInfo.classes,_userInfo.department,_userInfo.stdNumber,_userInfo.userName,_userInfo.userId,_userInfo.token]);

      }

    });

    // HttpUtils.get(APIs.runUrl + RUNAPIType[RunAPI.Login], success: (res) {
    //   print("登录页面数据：" + res);
    //   var bytes = utf8.encode("111111"); // data being hashed
    //   var psw = md5.convert(bytes).toString();
    //   Map<String, dynamic> data = {
    //     "username": "19412043",
    //     "password": psw,
    //     "sys_id": "iscpMobile",
    //   };
    //   var signKey =
    //       sha1.convert(utf8.encode(sortAsc(data))).toString().toUpperCase();
    //   data['sign'] = signKey;
    //   if (res != null) {
    //     HttpUtils.post(APIs.runUrl + RUNAPIType[RunAPI.DoLogin], data, success: (res) async{
    //       print("尝试登录："+ res);
    //       if(res.toString().contains('禁用')){
    //         Get.defaultDialog(
    //           title: '提示信息',
    //           content: Padding(padding: EdgeInsets.all(12),child: Text("用户被禁用"),),
    //           cancel: TextButton(onPressed: (){
    //             Get.back();
    //             Get.back();
    //           },child: Text('确定'),)
    //         );
    //       }
    //       else if(res.toString().contains('密码不正确')){
    //         Get.defaultDialog(
    //             title: '提示信息',
    //             content: Padding(padding: EdgeInsets.all(12),child: Text("密码不正确"),),
    //             cancel: TextButton(onPressed: (){
    //               Get.back();
    //               Get.back();
    //             },child: Text('确定'),)
    //         );
    //       }else{
    //         // data = new Map<String, dynamic>.from(res) ;
    //         var temp = new Map<String, dynamic>.from(res['user_fun']);
    //         temp.remove('element_funs');
    //         res['user_fun'] = temp;
    //         _userInfo = UserInfo.fromJson(res);
    //         SharedPreferences preferences =  await SharedPreferences.getInstance();
    //         preferences.setStringList('UserInfo', <String>[_userInfo.classes,_userInfo.department,_userInfo.stdNumber,_userInfo.userName,_userInfo.token]);
    //
    //       }
    //
    //     });}
    //
    // }, fail: (err) {});
  }
}
