import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrPage extends StatefulWidget {
  @override
  _QrPageState createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('体测二维码'),),
      body: Center(
        child: Column(
          children: [
            Text('黄昌河'),
            Text('18422044'),
            Text('信息工程学院自动182'),
            QrImage(
              data: "id=19412043&name=%E7%BD%97%E8%A5%BF",
              size: 200.0,
            ),
          ],
        ),
      ),
    );
  }
}
