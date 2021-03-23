import 'api_config.dart';
import 'dio_utils.dart';

typedef Success<T> = Function(T data);
typedef Fail = Function(int code);

class HttpUtils {
  //登录

  // static void login<T>(
  //   parameters, {
  //   Success success,
  //   Fail fail,
  // }) {
  //   post(APIs.login, parameters, success: success, fail: fail);
  // }
  //
  // //分页加载数据
  // static void getNewPageList<T>(
  //   parameters, {
  //   Success success,
  //   Fail fail,
  // }) {
  //   post(APIs.login, parameters, success: success, fail: fail);
  // }

  //GET
  static void getRequest<T>(
    APIType apiType, {
    parameters,
    Success success,
    Fail fail,
  }) {
    get(APITypeValues[apiType],
        parameters: parameters, success: success, fail: fail);
  }

  //POST
  static void postRequest<T>(
    APIType apiType,
    parameters, {
    Success success,
    Fail fail,
  }) {
    post(APITypeValues[apiType], parameters, success: success, fail: fail);
  }

  //get 请求
  static void get<T>(
    String url, {
    parameters,
    Success success,
    Fail fail,
  }) {
    _request(Method.GET, url,
        parameters: parameters, success: success, fail: fail);
  }

  //post 请求
  static void post<T>(String url, parameters,
      {Success success, Fail fail, Map<String, dynamic> headers}) {
    _request(Method.POST, url,
        parameters: parameters, headers:headers,success: success, fail: fail);
  }

  //_request 请求
  static void _request<T>(Method method, String url,
      {parameters, Success success, Fail fail, Map<String, dynamic> headers}) {
    parameters?.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
        // print("post 参数测试：" +url);
      }
    });

    DioUtils.request(method, url, parameters, success: (result) {
//      LogUtils.d("--------- response ---------");
//      LogUtils.d('$result');
//      LogUtils.print_(result);
//       if (result['code'] == 200) {
//         if (success != null) {
//           success(result);
//         }
//       } else {
//         //其他状态，弹出错误提示信息
//         //JhProgressHUD.showText(result['msg']);
//       }
      //print(result);
      if (success != null) {
        success(result);
      }
    }, fail: (code, msg) {
      //JhProgressHUD.showError(msg);
      if (fail != null) {
        fail(code);
      }
    },headers: headers);
  }
}
