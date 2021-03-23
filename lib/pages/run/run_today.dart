import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dlu/model/run/run_rule.dart';
import 'package:flutter_dlu/utils/api_config.dart';
import 'package:flutter_dlu/utils/http_utils.dart';
import 'package:flutter_dlu/utils/run_secret.dart';
import 'package:get/get.dart';
import '../account_config.dart';

class TodayPage extends StatefulWidget {
  @override
  _TodayPageState createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> with AutomaticKeepAliveClientMixin{

  AccountConfig _accountConfig = Get.find();
  RunRule _runRule ;
  @override
  void initState() {
    // 只在第一次初始化无数据时，请求数据
    if(_runRule == null){
      var param = {
        'userId': _accountConfig.runUserInfo.value.userId
      };
      var signKey =
      sha1.convert(utf8.encode(sortAsc(param))).toString().toUpperCase();
      param['sign'] = signKey;
      HttpUtils.post(APIs.runUrl + RUNAPIType[RunAPI.GetExeRule], param,success: (res){
        setState(() {
          _runRule = RunRule.fromJson(res);
        });
      },fail: (err){

      });
    }
    super.initState();
  }

  @override
  void dispose() {
    printInfo(info: "dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Text('跑操规则:' + ( _runRule!= null?_runRule.ruleMsg:' ')),
    );
  }

  // 切换 Tab 页面保活
  @override
  bool get wantKeepAlive => true;
}
