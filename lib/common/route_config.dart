import 'package:flutter_dlu/pages/home_page.dart';
import 'package:flutter_dlu/pages/jwc/jwc_page.dart';
import 'package:flutter_dlu/pages/login_page.dart';
import 'package:flutter_dlu/pages/run/run_page.dart';
import 'package:flutter_dlu/pages/run/run_info.dart';
import 'package:flutter_dlu/pages/run/run_qr.dart';
import 'package:flutter_dlu/pages/tc/tc_login_page.dart';
import 'package:flutter_dlu/pages/tc/tc_main_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RouteConfig {
  ///登录
  static final String main = "/";

  ///教务处
  static final String jwc = "/jwc";

  ///跑操系统
  static final String run = "/run";
  static final String runInfo = "/run/info";
  static final String runQR = "/run/qr";

  ///主页面
  static final String home = "/home";

  /// 体测系统
  static final String tc = "/tc/home";
  static final String tcLogin = "/tc/login";

  ///别名映射页面
  static final List<GetPage> getPages = [
    GetPage(name: main, page: () => LoginPage()),
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: jwc, page: () => JWCPage()),
    GetPage(name: tc, page: () => TCPage()),
    GetPage(name: run, page: () => RunPage()),
    GetPage(name: runQR, page: () => QrPage()),
    GetPage(name: runInfo, page: () => RunPageInfo()),
    GetPage(name: tcLogin, page: () => TcLoginPage()),
  ];
}
