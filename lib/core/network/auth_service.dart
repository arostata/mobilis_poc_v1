import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/auth_response.dart';

class AuthService {
  Future<AuthResponse> authenticateUser(
    String username,
    String password,
  ) async {


    final token = 'Basic Y2xpZW50SWQxOmNsaWVudFNlY3JldDE=';

    final response = await http.post(
      Uri.parse(
        'https://dev1.webassessor.com/WebAssessorWebServices/oauth/token?grant_type=password&username=$username&password=$password',
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token,
      },
    );

    if (response.statusCode == 200) {
      return AuthResponse.fromJson(jsonDecode(response.body));
    } else {
      return AuthResponse(message: "Invalid credentials");
    }
  }
}
