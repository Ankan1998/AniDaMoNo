import 'package:anime_fe/modules/home/model/user_info.dart';
import 'package:dio/dio.dart';

class DataProvider {
  String baseUrl = 'http://192.168.8.116:3000';

  Dio getDio() {
    Dio dio = new Dio();
    UserInfo _userInfo = UserInfo();
    dio.options.headers["authorization"] = "Bearer ${_userInfo.getAuthToken()}";
    return dio;
  }

  Future<dynamic> requestLoginEndpoint(String email, String password) async {
    Dio dio = getDio();
    print(dio.options.headers["authorization"]);
    try{
      Response response = await dio.post(
        baseUrl+'/users/login',
        data: {
          "email":email,
          "password":password
        }
      );
      return response;

    } catch(e) {
      return e;
    }
  }

  Future<dynamic> requestSignupEndpoint(String name, String email, String password) async {
    Dio dio = getDio();
    try{
      Response response = await dio.post(
          baseUrl+'/users/signup',
          data: {
            "name":name,
            "email":email,
            "password":password
          }
      );
      return response;

    } catch(e) {
      return e;
    }
  }

  Future<dynamic> requestProfileEndpoint() async {
    Dio dio = getDio();
    try{
      Response response = await dio.get(
          baseUrl+'/users/me',
      );
      return response;

    } catch(e) {
      return e;
    }
  }

}
