class AuthData{
  final String username;
  final String password;

  AuthData(this.username, this.password);

  Map<String, dynamic> toMap() => {
    'username': username,
    'password': password
  };
}