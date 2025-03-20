import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/auth_response.dart';

class AuthService {
  Future<AuthResponse> authenticateUser(
    String username,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse('https://your-api.com/auth/login'),
      body: jsonEncode({"username": username, "password": password}),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      return AuthResponse.fromJson(jsonDecode(response.body));
    } else {
      return AuthResponse(message: "Invalid credentials");
    }
  }
}
