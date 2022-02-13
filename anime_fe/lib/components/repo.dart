import 'package:anime_fe/components/data_provider.dart';
import 'package:anime_fe/components/graphql_services.dart';
import 'package:anime_fe/modules/home/model/user_info.dart';
import 'package:anime_fe/modules/home/model/user_model.dart';
import 'package:anime_fe/modules/login/model/login_model.dart';
import 'package:anime_fe/modules/signup/model/signup_model.dart';
import 'package:dio/dio.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repository{

  DataProvider _dataProvider = DataProvider();
  UserInfo _userInfo = UserInfo();
  GraphqlService _gqlService = GraphqlService();

  Future<int> verifyLogin(LoginModel loginData) async {
    final prefs = await SharedPreferences.getInstance();
    var result = await _dataProvider.requestLoginEndpoint(loginData.email,loginData.password);
    if(result.runtimeType == DioError){
      if(result.type == DioErrorType.response){
        return 400;
      }
      return 503;
    }
    UserModel _userModel = UserModel.fromJson(result.data);
    _userInfo.setAuthToken(_userModel.token);
    await prefs.setString('token', _userInfo.getAuthToken());
    return result.statusCode;
  }

  Future<int> startSignup(SignUpModel signUpData) async {
    final prefs = await SharedPreferences.getInstance();
    var result = await _dataProvider.requestSignupEndpoint(signUpData.name,signUpData.email,signUpData.password);
    if(result.runtimeType == DioError){
      if(result.type == DioErrorType.response){
        return 400;
      }
      return 503;
    }
    UserModel _userModel = UserModel.fromJson(result.data);
    _userInfo.setAuthToken(_userModel.token);
    await prefs.setString('token', _userInfo.getAuthToken());
    return result.statusCode;
  }

  // GraphQL

  Future<QueryResult> searchAnime(String animeName) async {
    QueryResult result = await _gqlService.searchAnime(animeName);
    return result;
  }

  Future<QueryResult> searchCharacter(String characterName) async {
    QueryResult result = await _gqlService.searchCharacter(characterName);
    return result;
  }
}