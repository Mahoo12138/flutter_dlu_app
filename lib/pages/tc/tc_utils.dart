import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

class TcUtils {
  static int getVT() {
    String scopeF = '123456789'; //首位
    String scopeC = '0123456789'; //中间
    String result = '';
    for (int i = 0; i < 6; i++) {
      if (i == 0) {
        result = scopeF[Random().nextInt(scopeF.length)];
      } else {
        result = result + scopeC[Random().nextInt(scopeC.length)];
      }
    }
    return int.parse(result);
  }

  static String getReqSign(data, vt) {
    var reqStr = Uri.encodeComponent(jsonEncode(data));

    var reqMD5Str = md5.convert(utf8.encode(reqStr)).toString();

    var lowerReqMD5Str = reqMD5Str.toLowerCase();
    var lowerReqMD5StrF16 = lowerReqMD5Str.substring(0, 16);
    var lowerReqMD5StrB16 = lowerReqMD5Str.substring(16);
    var signKey = 'ey%451*i50iek2*';
    // if (this.user.getSaltKey()
    //     && this.user.getSaltKey() !== '') {
    //   signKey = this.user.getSaltKey();
    // }
    var strOrigin = lowerReqMD5StrF16 + '_' + signKey + '_' + lowerReqMD5StrB16;
    var strOriginBytes = utf8.encode(strOrigin);
    var strMD5Origin = md5.convert(strOriginBytes).toString();
    return strMD5Origin;

  }

  static String getReqSignOfSalt(data, vt, slatKey) {
    var reqStr = Uri.encodeComponent(jsonEncode(data));

    var reqMD5Str = md5.convert(utf8.encode(reqStr)).toString();

    var lowerReqMD5Str = reqMD5Str.toLowerCase();
    var lowerReqMD5StrF16 = lowerReqMD5Str.substring(0, 16);
    var lowerReqMD5StrB16 = lowerReqMD5Str.substring(16);
    var signKey = slatKey;
    // if (this.user.getSaltKey()
    //     && this.user.getSaltKey() !== '') {
    //   signKey = this.user.getSaltKey();
    // }
    var strOrigin = lowerReqMD5StrF16 + '_' + signKey + '_' + lowerReqMD5StrB16;
    var strOriginBytes = utf8.encode(strOrigin);
    var strMD5Origin = md5.convert(strOriginBytes).toString();
    return strMD5Origin;

  }

  static String getMD5Pwd(pwd){
    var saltKey = '3t&6u18';
    var md5Pwd = md5.convert(utf8.encode(pwd + '_' + saltKey)).toString();
    return md5Pwd;
  }
}
