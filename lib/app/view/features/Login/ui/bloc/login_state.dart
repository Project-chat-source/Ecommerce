class LoginState {
  final String username;
  final String password;

  LoginState({this.username = '', this.password = ''});
}

final class LoginInitial extends LoginState {
  LoginInitial() : super();
}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final String successMessage;

  LoginSuccess({required this.successMessage});
}

final class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure({required this.errorMessage});
}
