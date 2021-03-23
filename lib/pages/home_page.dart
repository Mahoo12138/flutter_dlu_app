import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dlu/common/route_config.dart';
import 'package:flutter_dlu/model/hitokoto.dart';
import 'package:flutter_dlu/model/weather.dart';
import 'package:flutter_dlu/utils/api_config.dart';
import 'package:flutter_dlu/utils/http_utils.dart';
import 'package:get/route_manager.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String hitokotoContent = '初始化';
  String hitokotoFrom = "初始化";
  Weather weatherInfo;

  @override
  void initState() {
    _getHitokoto();
    // _getWeatherInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size mSize = MediaQuery.of(context).size;
    //密度
    double mRatio = MediaQuery.of(context).devicePixelRatio;
    //设备像素
    double width = mSize.width * mRatio;
    double height = mSize.height * mRatio;

    return Scaffold(
        appBar: AppBar(
          title: Text("连大生活+"),
        ),
        drawer: Drawer(),
        body: Center(
            child: Column(children: <Widget>[
          Flexible(
            child: Padding(
                padding: EdgeInsets.only(
                  top: 20,
                ),
                child: Container(
                  width: width * 0.4,
                  // color: Colors.amber,
                  /// 第一张卡片
                  child: Stack(
                    children: [
                      Card(
                        child: Image.asset(
                          'assets/image.jpg',
                          fit: BoxFit.cover,
                          width: width * 0.4,
                          height: height * 0.12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      ),
                      Positioned(
                        top: 30,
                        left: 25,
                        child: Container(
                          // color: Colors.blueAccent,
                          width: width * 0.35,
                          child: Column(
                            children: [
                              Container(
                                // color: Colors.pink,
                                width: width * 0.4,
                                child: Text(
                                  "今日连大",
                                  style: TextStyle(
                                      color: Colors.deepPurpleAccent,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                // color: Colors.amber,
                                width: width * 0.25,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      weatherInfo
                                              // ignore: null_aware_before_operator
                                              !=
                                              null
                                          ? (weatherInfo?.result?.realtime
                                                  ?.temperature) +
                                              '℃'
                                          : "未知温度",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    Text(
                                        weatherInfo?.result?.realtime?.info ??
                                            "未知天气",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18)),
                                    // ignore: null_aware_before_operator
                                    Text(
                                        (weatherInfo?.result?.realtime
                                                    ?.direct ??
                                                "未知") +
                                            (weatherInfo
                                                    ?.result?.realtime?.power ??
                                                "风力"),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        left: 25,
                        child: Container(
                          // color: Colors.blueAccent,
                          width: width * 0.36,
                          child: Column(
                            children: [
                              Container(
                                width: width * 0.4,
                                child: Text.rich(
                                  TextSpan(
                                      text: hitokotoContent,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {}),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                              Container(
                                width: 400,
                                child: Text(
                                  "—— " + hitokotoFrom,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            flex: 1,
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Container(
                    // color: Colors.blueAccent,
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        elevation: 5,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset('assets/1.jpg'),
                            ),
                            Positioned(
                              child: Text(
                                "选课和查询成绩？",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              top: 15,
                              left: 15,
                            ),
                            Positioned(
                              child: Text(
                                "全新设计的教务管理系统",
                                style: TextStyle(
                                    color: Colors.grey.shade400, fontSize: 12),
                              ),
                              top: 45,
                              left: 15,
                            ),
                            Positioned(
                              child: ElevatedButton(
                                  onPressed: () {
                                    // Navigator.of(context).pushNamed('/jwc');
                                    Get.toNamed(RouteConfig.jwc);
                                  },
                                  child: Text("教务处 →")),
                              bottom: 12,
                              right: 15,
                            )
                          ],
                        ),
                        margin: EdgeInsets.all(10)),
                    width: width * 0.4,
                  ),
                  Container(
                    // color: Colors.blueAccent,
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        elevation: 5,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset('assets/1.jpg'),
                            ),
                            Positioned(
                              child: Text(
                                "跑操和查看次数？",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              top: 15,
                              left: 15,
                            ),
                            Positioned(
                              child: Text(
                                "全新设计的跑操管理系统",
                                style: TextStyle(
                                    color: Colors.grey.shade400, fontSize: 12),
                              ),
                              top: 45,
                              left: 15,
                            ),
                            Positioned(
                              child: ElevatedButton(
                                  onPressed: () {
                                    // Navigator.of(context).pushNamed('/run');
                                    Get.toNamed(RouteConfig.run);
                                  },
                                  child: Text("跑操系统 →")),
                              bottom: 12,
                              right: 15,
                            )
                          ],
                        ),
                        margin: EdgeInsets.all(10)),
                    width: width * 0.4,
                  ),
                  Container(
                    // color: Colors.blueAccent,
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        elevation: 5,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset('assets/1.jpg'),
                            ),
                            Positioned(
                              child: Text(
                                "体测预约及查看？",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              top: 15,
                              left: 15,
                            ),
                            Positioned(
                              child: Text(
                                "全新设计的体测管理系统",
                                style: TextStyle(
                                    color: Colors.grey.shade400, fontSize: 12),
                              ),
                              top: 45,
                              left: 15,
                            ),
                            Positioned(
                              child: ElevatedButton(
                                  onPressed: () {
                                    // Navigator.of(context).pushNamed('/tc');
                                    Get.toNamed(RouteConfig.tcLogin);

                                  }, child: Text("体测系统 →")),
                              bottom: 12,
                              right: 15,
                            )
                          ],
                        ),
                        margin: EdgeInsets.all(10)),
                    width: width * 0.4,
                  ),
                ],
              ),
            ),
            flex: 2,
          ),
        ])));
  }

  /// 一言
  _getHitokoto() async {
    Response response = await Dio().get(APIs.hitokoto);
    Hitokoto hito = Hitokoto.fromJson(response.data);
    setState(() {
      hitokotoContent = hito.hitokoto;
      hitokotoFrom = hito.from;
    });
  }

  /// 教务处
  _getRequest() {
    HttpUtils.get(APIs.jwUrl + r'/default2.aspx', success: (res) {
      RegExp exp = new RegExp(r"\([0-9a-zA-Z_]*\)");
      String key = exp.firstMatch(res).group(0).substring(0, 26);
      print(key);
      print(APIs.jwUrl + '/' + key + r'/default2.aspx');
      HttpUtils.get(APIs.jwUrl + '/' + key + r'/default2.aspx', success: (res) {
        print(res);
      }, fail: (err) {
        print(err);
      });
    });
    print("按钮点击！");
  }

  /// 天气接口
  _getWeatherInfo() async {
    var params = {'city': '大连', 'key': 'b248d173e67960b90e422e2d16cd5f9c'};
    Response response =
        await Dio().get(APIs.weatherUrl, queryParameters: params);
    if (response != null) {
      weatherInfo = Weather.fromJson(response.data);
      setState(() {});
    }
  }
}
