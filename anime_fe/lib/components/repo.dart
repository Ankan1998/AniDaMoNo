import 'package:anime_fe/components/data_provider.dart';
import 'package:anime_fe/modules/home/model/user_info.dart';
import 'package:anime_fe/modules/home/model/user_model.dart';
import 'package:anime_fe/modules/login/model/login_model.dart';
import 'package:anime_fe/modules/signup/model/signup_model.dart';
import 'package:dio/dio.dart';

class Repository{
  DataProvider _dataProvider = DataProvider();
  UserInfo _userInfo = UserInfo();
  Future<int> verifyLogin(LoginModel loginData) async {
    var result = await _dataProvider.requestLoginEndpoint(loginData.email,loginData.password);
    if(result.runtimeType == DioError){
      if(result.type == DioErrorType.response){
        return 400;
      }
      return 503;
    }
    UserModel _userModel = UserModel.fromJson(result.data);
    _userInfo.setAuthToken(_userModel.token);
    return result.statusCode;
  }

  Future<int> startSignup(SignUpModel signUpData) async {
    var result = await _dataProvider.requestSignupEndpoint(signUpData.name,signUpData.email,signUpData.password);
    if(result.runtimeType == DioError){
      if(result.type == DioErrorType.response){
        return 400;
      }
      return 503;
    }
    UserModel _userModel = UserModel.fromJson(result.data);
    _userInfo.setAuthToken(_userModel.token);
    return result.statusCode;
  }
}