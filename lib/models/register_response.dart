class RegisterResponse {

  bool? canLogin;

  RegisterResponse({this.canLogin});

  @override
  String toString() {
    return 'RegisterResponse{canLogin: $canLogin}';
  }
}