import 'dart:async';

import 'package:anime_fe/components/repo.dart';
import 'package:anime_fe/modules/signup/model/signup_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  Repository repo = Repository();
  SignUpBloc() : super(SignUpInitial()) {
    on<StartSignUpEvent>(_startSignUp);
  }

  void _startSignUp(StartSignUpEvent event, Emitter<SignUpState> emit) async {
    int status = await repo.startSignup(event.signUpModel);
    if(status == 201){
      emit(SignUpSuccess());
    } else if(status == 400){
      emit(SignUpFailure());
    } else {
      emit(NetworkIssue());
    }
  }
}
