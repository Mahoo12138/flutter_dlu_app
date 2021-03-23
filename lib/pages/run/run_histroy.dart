import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  @override
  _TodayPageState createState() => _TodayPageState();
}

class _TodayPageState extends State<HistoryPage> {
  @override
  void initState() {
    // TODO: 跑操次数
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Expanded(child:  Container(
           padding: EdgeInsets.all(15),
           child: GridView.count(
             shrinkWrap: true,
             physics: NeverScrollableScrollPhysics(),
             crossAxisCount: 4,
             children: List.generate(4, (index) {
               return Padding(
                   padding: EdgeInsets.all(5),
                   child: Container(
                     color: Colors.greenAccent,
                     child: Text("次数不多"),
                   ));
             }),
           )),flex: 1,),
       Expanded(child:  Container(
           padding: EdgeInsets.only(left: 15,right: 15,bottom: 15),
           child: Card(color: Colors.indigoAccent,
             child: Container(

             ),
           )
       ),flex: 4,)
      ],
    );
  }
}
