import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'api_config.dart';
import 'error_handle.dart';
import 'package:cookie_jar/cookie_jar.dart';

const int _connectTimeout = 15000; //15s
const int _receiveTimeout = 15000;
const int _sendTimeout = 10000;

typedef Success<T> = Function(T data);
typedef Fail = Function(int code, String msg);

class DioUtils {
  static final CookieJar cookieJar = new CookieJar();
  // default options
  static const String TOKEN = '';

  static Dio _dio;

  // 创建 dio 实例对象
  static Dio createInstance() {
    if (_dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      var options = BaseOptions(
        /// 请求的Content-Type，默认值是"application/json; charset=utf-8".
        /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
        /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]就会自动编码请求体.
        /// contentType: Headers.formUrlEncodedContentType, // 适用于post form表单提交
        /// responseType: ResponseType.json,
        validateStatus: (status) {
          return status < 500;
          // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
        },
        baseUrl: APIs.apiPrefix,
        // headers: httpHeaders,
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
        sendTimeout: _sendTimeout,
        followRedirects: false,
      );

      _dio = new Dio(options);
      _dio.interceptors.add(CookieManager(cookieJar));
      _dio.interceptors
          .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
        // 在请求被发送之前做一些事情
        // print("header：" + options.headers.toString());
        // print(options.data);

        if (options.path.contains('http-8081')) {
          // print("yes found 8081 !");
          options.headers
            ..addAll({
              'connection': 'keep-alive',
              'accept-encoding': 'gzip, deflate',
              'accept-language':
                  'zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6',
              'accept': 'application/json, text/plain, */*',
              'user-agent':
                  "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36 Edg/87.0.664.75",
            });
          // print("Header8081: " + options.headers.toString());
        } else if (options.path.contains('login')) {
          // print("yes found VPN login !");
          options.headers
            ..remove('content-type')
            ..addAll({
              'Content-Type':
                  "application/x-www-form-urlencoded; charset=UTF-8",
              'Accept': '*/*',
              'User-Agent':
                  "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36 Edg/87.0.664.75",
            });
        } else if (options.path.contains('http-8080')) {
          // print("yes found 8080 !");
          options.headers
            ..remove('content-type')
            ..addAll({
              'Upgrade-Insecure-Requests': 1,
              'User-Agent':
                  "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36 Edg/87.0.664.75",
              'Accept': 'text/html,application/xhtml+xml,' +
                  'application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
              'Accept-Encoding': 'gzip, deflate',
            });

          // print("Header8080: " + options.headers.toString());
        }
        return options; //continue
        // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
        // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
        //
        // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
        // 这样请求将被中止并触发异常，上层catchError会被调用。
      }, onResponse: (Response response) async {
        // 在返回响应数据之前做一些预处理
        return response; // continue
      }, onError: (DioError e) async {
        // 当请求失败时做一些预处理
        return e; //continue
      }));
    }
    return _dio;
  }

  // 清空 dio 对象
  static clear() {
    _dio = null;
  }

  // 请求，返回参数为 T
  // method：请求方法，Method.POST等
  // path：请求地址
  // params：请求参数
  // success：请求成功回调
  // error：请求失败回调
  static Future request<T>(Method method, String path, dynamic params,
      {Success success, Fail fail, Map<String, dynamic> headers}) async {
    try {
      //没有网络
      var connectivityResult = await (new Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        _onError(ExceptionHandle.net_error, '网络异常，请检查你的网络！', fail);
        return;
      }

      Dio _dio = createInstance();
      if (method == Method.GET) {
        Response response = await _dio.request(path,
            data: params, options: Options(method: MethodValues[method],headers: headers));
        if (response != null) {
          //print("response" + response.toString());
          if (success != null) {
            success(response.data);
            // success(response);
          }
        } else {
          _onError(ExceptionHandle.unknown_error, '未知错误', fail);
        }
      } else {
        Response response = await _dio.post(path,
            data: params,
            options: Options(
                method: MethodValues[method],
                contentType: Headers.jsonContentType,headers: headers));
        if (response != null) {
          if (success != null) {
            success(response.data);
          }
        } else {
          _onError(ExceptionHandle.unknown_error, '未知错误', fail);
        }
      }
    } on DioError catch (e) {
      final NetError netError = ExceptionHandle.handleException(e);
      _onError(netError.code, netError.msg, fail);
    }
  }
}

/// 自定义Header
Map<String, dynamic> httpHeaders = {
  'Accept': 'application/json,*/*',
  //'Content-Type': 'application/json;charset=UTF-8',
  'User-Agent':
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36 Edg/87.0.664.75'
};

void _onError(int code, String msg, Fail fail) {
  if (code == null) {
    code = ExceptionHandle.unknown_error;
    msg = '未知异常';
  }
  print('接口请求异常： code: $code, msg: $msg');
  if (fail != null) {
    fail(code, msg);
  }
}

Map<String, dynamic> parseData(String data) {
  return json.decode(data) as Map<String, dynamic>;
}

enum Method { GET, POST, DELETE, PUT, PATCH, HEAD }
//使用：MethodValues[Method.POST]
const MethodValues = {
  Method.GET: "get",
  Method.POST: "post",
  Method.DELETE: "delete",
  Method.PUT: "put",
  Method.PATCH: "patch",
  Method.HEAD: "head",
};
