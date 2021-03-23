import 'package:flutter/material.dart';
import 'package:flutter_dlu/model/tc/msg_list.dart';
import 'package:get/get.dart';

class TcMsgPage extends StatefulWidget {
  final MsgList msgList;

  const TcMsgPage({Key key, this.msgList}) : super(key: key);
  @override
  _TcMsgPageState createState() => _TcMsgPageState();
}

enum loadStatus{
  loadMore,
  loading,
  loadOver
}

class _TcMsgPageState extends State<TcMsgPage> {


  var loadFlag = loadStatus.loadMore;

  ScrollController scrollController = ScrollController();
  List<InFoList> _allMsgList = [];
  List<InFoList> _showMsgList = [];

  @override
  void initState() {
    if (widget.msgList != null) {
      widget.msgList.resp.inFoList.forEach((element) {
        _allMsgList.add(element);
      });
      _showMsgList = _allMsgList.sublist(0, 15);
      print("加载更多前：展示的数据-${_showMsgList.length},总数据-${_allMsgList.length}");
    }
    this.scrollController.addListener(() {
      if (this.loadFlag == loadStatus.loadMore &&
          this.scrollController.position.pixels >=
              this.scrollController.position.maxScrollExtent) {
        setState(() {
          this.loadFlag = loadStatus.loading;
        });
        this._loadMoreMsg();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    this.scrollController.dispose();
    super.dispose();
  }

  Future _loadMoreMsg() {
    return Future.delayed(Duration(seconds: 2), () {
      setState(() {
        this.loadFlag = loadStatus.loadMore;
        if(_showMsgList.length < _allMsgList.length){
          this._showMsgList.addAll(
              _allMsgList.sublist(15, _allMsgList.length));
          print("加载更多后：展示的数据-${_showMsgList.length},总数据-${_allMsgList.length}");

        }else{
          this.loadFlag = loadStatus.loadOver;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    return Container(
      padding: EdgeInsets.only(top: 25),
      child: Column(
        children: [
          ListTile(
            title: Text(
              '消息通知',
              style: TextStyle(fontSize: 25),
            ),
          ),
          Container(
            height: screenHeight - 100,
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(height: .6, color: Color(0xFFDDDDDD));
                },
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _showMsgList.length + 1,
                controller: this.scrollController,
                itemBuilder: (context, index) {
                  if (index < this._showMsgList.length) {
                    return ListTile(
                      leading: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/icons/icon_msg.png'),
                                fit: BoxFit.fill)),
                      ),
                      title: Text(_showMsgList[index].title + '-' + _showMsgList[index].createTime),
                      onTap: (){
                        Get.defaultDialog(
                          title: _showMsgList[index].title,
                          content: Container(
                            padding: EdgeInsets.all(18),
                            child: Text(_showMsgList[index].content),
                          ),
                          confirm: TextButton(onPressed: (){
                            /// ToDo 发送已读请求
                            Get.back();
                          }, child: Text('确定')),

                        );
                      },
                    );
                  } else {
                    return this.renderBottom();
                  }
                }),
          )
        ],
      ),
    );
  }

  Widget renderBottom() {
    switch(loadFlag){
      case loadStatus.loading:
        // printInfo(info: "loading");
        return Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '努力加载中...',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF333333),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 10)),
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 3),
              ),
            ],
          ),
        );
        break;
      case loadStatus.loadMore:
        return Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          child: Text(
            '上拉加载更多',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF333333),
            ),
          ),
        );
        break;
      case loadStatus.loadOver:
        return Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          child: Text(
            '我也是有底线的',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF333333),
            ),
          ),
        );
        break;
    }
  }
}
