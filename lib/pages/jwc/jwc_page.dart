import 'package:flutter/material.dart';
import 'package:flutter_dlu/utils/api_config.dart';
import 'package:flutter_dlu/utils/http_utils.dart';

import 'jwc_page_transcript.dart';

class JWCPage extends StatefulWidget {
  @override
  _JWCPageState createState() => _JWCPageState();
}

class _JWCPageState extends State<JWCPage> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _getRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("连大教务管理系统"),
        bottom: TabBar(
          unselectedLabelColor: Colors.grey.shade400,
          labelColor: Colors.white,
          controller: _tabController,
          tabs: [
            Tab(
              text: "选课",
            ),
            Tab(
              text: "考试",
            ),
            Tab(
              text: "成绩",
            ),
            Tab(
              text: "评价",
            ),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.home), onPressed: (){
            Navigator.of(context).pushReplacementNamed('/home');
          })
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: Text("页面1"),
          ),
          Center(
            child: Text("页面2"),
          ),
          Center(
            child: Transcript(),
          ),
          Center(
            child: Text("页面4"),
          ),
        ],
      ),
    );
  }

  /// 教务处
  _getRequest() {
    HttpUtils.get(APIs.jwUrl + r'/default2.aspx', success: (res) {
      //print("打印初次结果" + res);
      RegExp exp = new RegExp(r"\([0-9a-zA-Z_]*\)");
      if (exp.firstMatch(res) == null){
        print("失败");
      }else{
        String key = exp.firstMatch(res).group(0).substring(0, 26);
        print(key);
        print(APIs.jwUrl + '/' + key + r'/default2.aspx');
        HttpUtils.get(APIs.jwUrl + '/' + key + r'/default2.aspx', success: (res) {
          print(res);
        }, fail: (err) {
          print(err);
        });
      }

    });
    print("按钮点击！");
  }
}
