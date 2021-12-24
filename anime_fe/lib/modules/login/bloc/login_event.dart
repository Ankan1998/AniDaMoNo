part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class VerifyLoginEvent extends LoginEvent{
  final LoginModel loginModel;
  const VerifyLoginEvent(this.loginModel);
}
