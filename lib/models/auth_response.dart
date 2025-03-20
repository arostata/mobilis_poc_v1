class AuthResponse {
  final String? accessToken;
  final String? message;

  AuthResponse({this.accessToken, this.message});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      accessToken: json['access_token'],
      message: json['message'],
    );
  }
}
