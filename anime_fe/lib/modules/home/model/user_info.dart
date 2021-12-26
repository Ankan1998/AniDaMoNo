class UserInfo{

  static UserInfo _instance = UserInfo._();
  UserInfo._();

  String authToken='';

  factory UserInfo() {
    return _instance;
  }

  setAuthToken(String token){
    this.authToken = token;
  }

  getAuthToken(){
    return this.authToken;
  }
}