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

  // USERS
  Future<dynamic> requestLoginEndpoint(String email, String password) async {
    Dio dio = getDio();
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

  Future<dynamic> updateUserEndpoint(String name, String password) async {
    Dio dio = getDio();
    try{
      Response response = await dio.post(
          baseUrl+'/users/update',
          data: {
            "name":name,
            "password":password
          }
      );
      return response;

    } catch(e) {
      return e;
    }
  }

  Future<dynamic> requestLogoutEndpoint() async {
    Dio dio = getDio();
    try{
      Response response = await dio.get(
        baseUrl+'/users/logout',
      );
      return response;

    } catch(e) {
      return e;
    }
  }

  Future<dynamic> requestLogoutAllEndpoint() async {
    Dio dio = getDio();
    try{
      Response response = await dio.get(
        baseUrl+'/users/logoutAll',
      );
      return response;

    } catch(e) {
      return e;
    }
  }

  Future<dynamic> requestDeleteUserEndpoint() async {
    Dio dio = getDio();
    try{
      Response response = await dio.delete(
        baseUrl+'/users/delete',
      );
      return response;

    } catch(e) {
      return e;
    }
  }

  Future<dynamic> requestUploadDpEndpoint(String url) async {
    Dio dio = getDio();
    try{
      Response response = await dio.post(
          baseUrl+'/upload/url',
          data: {
            "dp":url,
          }
      );
      return response;

    } catch(e) {
      return e;
    }
  }

  Future<dynamic> requestDpEndpoint() async {
    Dio dio = getDio();
    try{
      Response response = await dio.get(
        baseUrl+'/download/url',
      );
      return response;

    } catch(e) {
      return e;
    }
  }

  //ANIME
  Future<dynamic> saveAnimeEndpoint(String id) async {
    Dio dio = getDio();
    try{
      Response response = await dio.post(
          baseUrl+'/animes/save/${id}',
      );
      return response;

    } catch(e) {
      return e;
    }
  }

  Future<dynamic> requestAnimeEndpoint() async {
    Dio dio = getDio();
    try{
      Response response = await dio.get(
        baseUrl+'/animes',
      );
      return response;

    } catch(e) {
      return e;
    }
  }

  Future<dynamic> updateAnimeEndpoint(String id, bool watched, int waitlist) async {
    Dio dio = getDio();
    try{
      Response response = await dio.post(
          baseUrl+'/animes/update/${id}',
          data: {
            "watched":watched,
            "waitlist":waitlist
          }
      );
      return response;

    } catch(e) {
      return e;
    }
  }

  Future<dynamic> requestDeleteAnimeEndpoint(String id) async {
    Dio dio = getDio();
    try{
      Response response = await dio.delete(
        baseUrl+'/animes/delete/${id}',
      );
      return response;

    } catch(e) {
      return e;
    }
  }

  Future<dynamic> requestDeleteAllAnimeEndpoint() async {
    Dio dio = getDio();
    try{
      Response response = await dio.delete(
        baseUrl+'/animes/deleteAll',
      );
      return response;

    } catch(e) {
      return e;
    }
  }

  //Character

  Future<dynamic> saveCharacterEndpoint(String id) async {
    Dio dio = getDio();
    try{
      Response response = await dio.post(
        baseUrl+'/characters/fav/${id}',
      );
      return response;

    } catch(e) {
      return e;
    }
  }

  Future<dynamic> requestCharacterEndpoint() async {
    Dio dio = getDio();
    try{
      Response response = await dio.get(
        baseUrl+'/characters',
      );
      return response;

    } catch(e) {
      return e;
    }
  }

  Future<dynamic> requestDeleteCharacterEndpoint(String id) async {
    Dio dio = getDio();
    try{
      Response response = await dio.delete(
        baseUrl+'/characters/delete/${id}',
      );
      return response;

    } catch(e) {
      return e;
    }
  }

  Future<dynamic> requestDeleteAllCharacterEndpoint() async {
    Dio dio = getDio();
    try{
      Response response = await dio.delete(
        baseUrl+'/characters/deleteAll',
      );
      return response;

    } catch(e) {
      return e;
    }
  }

}
