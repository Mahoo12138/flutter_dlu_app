import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dlu/model/tc/body_info.dart';
import 'package:flutter_dlu/model/tc/msg_list.dart';
import 'package:flutter_dlu/model/tc/unread_msg.dart';
import 'package:flutter_dlu/pages/tc/tc_message.dart';
import 'package:flutter_dlu/pages/tc/tc_utils.dart';
import 'package:flutter_dlu/utils/api_config.dart';
import 'package:flutter_dlu/utils/http_utils.dart';
import 'package:get/get.dart';
import '../account_config.dart';
import 'package:badges/badges.dart';

class TCPage extends StatefulWidget {
  @override
  _TCPageState createState() => _TCPageState();
}

class _TCPageState extends State<TCPage> {
  final AccountConfig accountConfig = Get.find();

  GlobalKey<ScaffoldState> _endDrawerKey = GlobalKey();

  BodyInfo bodyInfo;
  MsgList msgList;

  int _unReadMsgCount = 0;

  List<List<String>> data = [
    [
      'BMI得分',
      '身体质量指数（BMI，Body Mass Index）是国际上常用的衡量人体肥胖程度和是否健康的重要标准，BMI 通过人体体重和身高两个数值获得相对客观的参数，并用这个参数所处范围衡量身体质量。其值由人体成分体检得到，在18至24范围内是最标准的哦。'
    ],
    [
      'BFR指数',
      '身体素质指数是综合体育测试、日常运动锻炼、人体成分监测等多维度因素，利用专利算法得出的一个综合指标。其反映了人体当前状态的基本素质，可以作为重要衡量指标予以参考。正常成年人的体脂率分别是男性15%~18%和女性25%~28%。若体脂率过高，体重超过正常值的20%以上就可视为肥胖。肥胖则表明运动不足、营养过剩或有某种内分泌系统的疾病，而且常会并发高血压、高血脂症、动脉硬化、冠心病、糖尿病、胆囊炎等病症；若体脂率过低，低于体脂含量的安全下限，即男性5%，女性13%~15%，则可能引起功能失调。 其值由人体成分体检得到。'
    ],
    [
      '运动指数',
      '运动指数（DSI）根据调查中您填写的日常运动调查，结合人体成分体检综合分析的结果。保持良好的睡眠，推进有规律的每天运动，保持每天的运动量，有利于保持身体健康哦。分数越高，说明您的运动指数越好哦。'
    ],
    [
      '饮食指数',
      '饮食指数（HEI）根据调查中您填写的膳食营养调查，结合人体成分体检综合分析的结果。人类的食物是多种多样的，各种食物所含的营养成分不完全相同，因此平衡膳食必须由多种食物组成，才能满足人体各种营养需要，达到合理营养、促进健康的目的。分数越高，说明您的饮食指数越好哦。'
    ],
    [
      '体测指数',
      '体测指数即体育测试分数，其是每学期的体育测试综合分数，目前体测范畴包括身高体重、肺活量、50m跑、立定跳远、坐位体前屈、800米跑、1000米跑、仰卧起坐、引体向上等组成。体能测试的目的是为了促进您加强锻炼，提高体质健康水平，让您意识到健康对人一生的进步发展的重要性。拥有一个健康的体魄是迈向成功的重要基础，只有坚持经常参加体育活动，养成坚持锻炼身体的良好习惯，才能增强体质，提高健康水平。分数越高，说明您的体育测试指数越好哦。'
    ],
    [
      '跑操指标',
      '跑操指标是衡量您日常早晚操出勤和执行状况，其综合您最近一段时间跑操数据，利用大数据分析算法得出的。保持良好的出勤率和在规定时间内完成跑操距离有利于提高您的跑操指标哦。'
    ],
  ];

  @override
  void initState() {
    _tcGetBodyIndex();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _endDrawerKey,
      body: Center(child: buildPage()),
      endDrawer: Drawer(
        child: TcMsgPage(msgList: msgList),
      ),
    );
  }

  Widget buildPage() {
    return Padding(
      padding: EdgeInsets.all(35),
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Welcome, ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            child: Obx(() => Text(
                                  accountConfig.tcUserInfo.value.nick,
                                  style: TextStyle(fontSize: 35),
                                ))),
                      ],
                    ),
                  )),
                  Container(
                    child: IconButton(
                        icon: Badge(
                          badgeContent: Text(_unReadMsgCount.toString()),
                          child: Icon(Icons.mail),
                        ),
                        onPressed: () {
                          _endDrawerKey.currentState.openEndDrawer();
                          // Scaffold.of(context).openEndDrawer();
                          // Navigator.of(context).pushReplacementNamed('/home');
                        }),
                  )
                ],
              )),
          Expanded(
              flex: 3,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.cyan,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 20, top: 5),
                      // color: Colors.greenAccent,
                      alignment: Alignment.topRight,
                      width: double.infinity,
                      child: RawChip(
                        backgroundColor: Colors.yellow,
                        label: Text("身体素质指数"),
                        onDeleted: () {
                          print("sad");
                        },
                        deleteIcon: Icon(Icons.privacy_tip_outlined),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        bodyInfo != null
                            ? bodyInfo.resp.parList[1].totalScore.toString()
                            : '无',
                        style: TextStyle(fontSize: 50),
                      ),
                    ),
                    // SizedBox.fromSize(
                    //   size: Size(0, 45),
                    // )
                  ],
                ),
              )),
          Expanded(
              flex: 6,
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                children: List.generate(6, (index) {
                  return Padding(
                    padding: EdgeInsets.all(3),
                    child: Container(
                        // decoration: BoxDecoration(
                        //   color: Colors.black,
                        //   borderRadius: BorderRadius.all(Radius.circular(20.0))
                        // ),
                        // padding: EdgeInsets.all(7),
                        height: 15,
                        // color: Colors.primaries[i % Colors.primaries.length],
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          color: Colors.deepPurpleAccent,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                right: 0,
                                top: 25,
                                child: SizedBox.fromSize(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset('assets/icons/icon0' +
                                        (index + 1).toString() +
                                        '.png'),
                                  ),
                                  size: Size(45, 45),
                                ),
                              ),
                              Positioned(
                                left: 8,
                                bottom: 12,
                                child: Column(
                                  children: [
                                    Text(
                                      bodyInfo != null
                                          ? bodyInfo.resp.parList[0]
                                              .result[index].suggestContent
                                          : '未知',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          bodyInfo != null
                                              ? (bodyInfo
                                                          .resp
                                                          .parList[0]
                                                          .result[index]
                                                          .testValue ==
                                                      -1
                                                  ? (data[index][0] +
                                                      ':' +
                                                      bodyInfo
                                                          .resp
                                                          .parList[0]
                                                          .result[index]
                                                          .fraction
                                                          .toString())
                                                  : data[index][0] +
                                                      ':' +
                                                      bodyInfo
                                                          .resp
                                                          .parList[0]
                                                          .result[index]
                                                          .testValue
                                                          .toString())
                                              : '未知',
                                          style: TextStyle(
                                              color: Colors.grey.shade200,
                                              fontSize: 9),
                                        ),
                                        GestureDetector(
                                          child: Icon(
                                            Icons
                                                .arrow_drop_down_circle_outlined,
                                            size: 12,
                                            color: Colors.white,
                                          ),
                                          onTap: () {
                                            print("ontap");
                                            Get.bottomSheet(Container(
                                              padding: EdgeInsets.only(
                                                  top: 15, left: 25, right: 25),
                                              height: 360,
                                              color: Colors.white,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 36,
                                                    child: Text(
                                                      data[index][0],
                                                      style: TextStyle(
                                                          fontSize: 25),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        top: 15),
                                                    height: 240,
                                                    child: Text(
                                                      data[index][1],
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 6,
                                                    ),
                                                  ),
                                                  RawChip(
                                                    backgroundColor: Colors.greenAccent,
                                                    tooltip: '关闭',
                                                      shape: CircleBorder(side: BorderSide.none),
                                                      label: IconButton(
                                                          onPressed: () {
                                                            Get.back();
                                                          },
                                                          icon: Icon(Icons
                                                              .close_rounded)))
                                                ],
                                              ),
                                            ));
                                          },
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                  );
                }),
              )),
          Expanded(
              flex: 3,
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.indigoAccent,
                child: Column(
                  children: [
                    ListTile(
                      title: Text("我的预约",style: TextStyle(fontSize: 18,color: Colors.white),),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('开始预约'),
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(250, 15)),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(12)),
                          elevation: MaterialStateProperty.all(0.0)),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  void _tcGetBodyIndex() {
    var vt = TcUtils.getVT();
    var param = {
      "common": {
        "version": "1.0",
        "platform": "android",
        "vt": vt,
        "uid": accountConfig.tcUserInfo.value.uid,
        "token": "${accountConfig.tcUserInfo.value.token}"
      },
      "req": {}
    };
    var myHeader = {
      'SESSION': "${accountConfig.tcUserInfo.value.token}",
      'X-Requested-With': 'com.dlcvc.ecs',
      'Content-Type': 'application/json'
    };
    var sign = TcUtils.getReqSignOfSalt(
        param, vt, accountConfig.tcUserInfo.value.saltKey);
    HttpUtils.post(
        APIs.tcUrl +
            TCAPIType[TcAPI.GetBodyIndex] +
            '?from=2&appId=1&vt=' +
            vt.toString() +
            '&sign=' +
            sign,
        param,
        headers: myHeader, success: (res) {
      // print(res);
      setState(() {
        bodyInfo = BodyInfo.fromJson(res);
        _tcGetUnreadMessageCont();
        // print(bodyInfo.resp.parList[1].totalScore);
      });
    }, fail: (err) {
      print(err);
    });
  }

  void _tcGetUnreadMessageCont() {
    var vt = TcUtils.getVT();
    var param = {
      "common": {
        "version": "1.0",
        "platform": "android",
        "vt": vt,
        "uid": accountConfig.tcUserInfo.value.uid,
        "token": "${accountConfig.tcUserInfo.value.token}"
      },
      "req": {}
    };
    // print(accountConfig.tcUserInfo.value.token);
    var sign = TcUtils.getReqSignOfSalt(
        param, vt, accountConfig.tcUserInfo.value.saltKey);
    var myHeader = {
      'session': "${accountConfig.tcUserInfo.value.token}",
      'x-requested-with': 'com.dlcvc.ecs',
      'content-type': 'application/json'
    };
    HttpUtils.post(
        APIs.tcUrl +
            TCAPIType[TcAPI.GetUnreadMsgCont] +
            '?from=2&appId=1&vt=' +
            vt.toString() +
            '&sign=' +
            sign,
        param,
        headers: myHeader, success: (res) {
      print(res);
      setState(() {
        _unReadMsgCount = UnreadMsg.fromJson(res).resp.unreadCont;
      });
      _tcGetUnreadMessageList(_unReadMsgCount);
    }, fail: (err) {});
  }

  void _tcGetUnreadMessageList(int msgNum) {
    var vt = TcUtils.getVT();
    var param = {
      "common": {
        "version": "1.0",
        "platform": "android",
        "vt": vt,
        "uid": accountConfig.tcUserInfo.value.uid,
        "token": "${accountConfig.tcUserInfo.value.token}"
      },
      "req": {"start": 0, "end": msgNum}
    };
    var myHeader = {
      'session': "${accountConfig.tcUserInfo.value.token}",
      'x-requested-with': 'com.dlcvc.ecs',
      'content-type': 'application/json'
    };
    var sign = TcUtils.getReqSignOfSalt(
        param, vt, accountConfig.tcUserInfo.value.saltKey);
    HttpUtils.post(
        APIs.tcUrl +
            TCAPIType[TcAPI.GetUnreadMsgList] +
            '?from=2&appId=1&vt=' +
            vt.toString() +
            '&sign=' +
            sign,
        param,
        headers: myHeader, success: (res) {
      print(res);
      setState(() {
        msgList = MsgList.fromJson(res);
      });
      print(msgList.resp.inFoList[0].content);
    }, fail: (err) {});
  }
}
