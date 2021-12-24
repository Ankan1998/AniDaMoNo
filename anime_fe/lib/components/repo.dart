import 'package:anime_fe/components/data_provider.dart';
import 'package:anime_fe/modules/login/model/login_model.dart';
import 'package:dio/dio.dart';

class Repository{
  DataProvider _dataProvider = DataProvider();

  Future<int> verifyLogin(LoginModel loginData) async {
    var result = await _dataProvider.requestLoginEndpoint(loginData.email,loginData.password);
    if(result.runtimeType == DioError){
      return 503;
    }
    return result.statusCode;
  }
}