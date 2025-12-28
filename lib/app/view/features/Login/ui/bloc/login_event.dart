sealed class LoginEvent {
  final String username;
  final String password;

  LoginEvent({this.username = '', this.password = ''});
}


final class LoginSubmitted extends LoginEvent {
  LoginSubmitted({required super.username, required super.password});
}