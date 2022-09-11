part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginSubmitted extends LoginEvent {
  final String email;
  final String password;
  final BuildContext context;

  const LoginSubmitted(this.email, this.password, this.context);

  @override
  List<Object> get props => [email, password, context];
}
