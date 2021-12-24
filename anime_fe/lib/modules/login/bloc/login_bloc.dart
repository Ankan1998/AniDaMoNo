import 'dart:async';

import 'package:anime_fe/components/repo.dart';
import 'package:anime_fe/modules/login/model/login_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  Repository repo = Repository();
  LoginBloc() : super(LoginInitial()) {
    on<VerifyLoginEvent>(_onLoginEvent);
  }

  void _onLoginEvent(VerifyLoginEvent event, Emitter<LoginState> emit) async {
    int status = await repo.verifyLogin(event.loginModel);
    if(status == 200){
      emit(LoginSuccess());
    } else if(status == 400){
      emit(LoginFailure());
    } else{
      emit(NetworkIssue());
    }
  }
}
