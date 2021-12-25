part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class StartSignUpEvent extends SignUpEvent{
  final SignUpModel signUpModel;
  const StartSignUpEvent(this.signUpModel);
}