part of 'login_bloc.dart';

enum LoginStatus { initial, success }

class LoginState {
  final LoginStatus status;
  final LoginModel? loginModel;

  LoginState._({this.status = LoginStatus.initial, this.loginModel});

  LoginState.unknown() : this._();

  LoginState.login(LoginModel loginModel)
      : this._(
          status: LoginStatus.success,
          loginModel: loginModel,
        );

}
