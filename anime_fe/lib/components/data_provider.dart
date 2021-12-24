import 'package:dio/dio.dart';

class DataProvider {
  Dio dio = new Dio();
  String baseUrl = 'http://192.168.8.116:3000';

  Future<dynamic> requestLoginEndpoint(String email, String password) async {
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
}