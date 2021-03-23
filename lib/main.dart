import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'common/route_config.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // routes: <String, WidgetBuilder>{
      //   '/home': (context) => HomePage(),
      //   '/run': (context) => RunPage(),
      //   '/run/info': (context) => RunPageInfo(),
      //   '/jwc': (context) => JWCPage(),
      //   '/tc':(context) => TCPage(),
      // },
      initialRoute: '/',
      getPages: RouteConfig.getPages,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
          primaryColor: Colors.red
      ),
      // home: LoginPage(),
    );
  }
}