import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/routes/app_router.dart';
import '../models/login_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginModel loginModel;

  LoginBloc(
    this.loginModel,
  ) : super(LoginState.unknown()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  void _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) {
    try {
      emit(LoginState.unknown());
      emit(LoginState.login(loginModel));
      event.context.router.navigate(const HomeRoute());
    } catch (_) {}
  }
}
