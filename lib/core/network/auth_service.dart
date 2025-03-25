import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/auth_response.dart';

class AuthService {
  Future<AuthResponse> authenticateUser(
    String username,
    String password,
  ) async {


    //dev1
    // final token = 'Basic Y2xpZW50SWQxOmNsaWVudFNlY3JldDE=';

    // final response = await http.post(
    //   Uri.parse(
    //     'https://dev1.webassessor.com/WebAssessorWebServices/oauth/token?grant_type=password&username=$username&password=$password',
    //   ),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //     'Authorization': token,
    //   },
    // );

    //local
    final token = 'Basic Y2xpZW50SWQ6Y2xpZW50U2VjcmV0';
    final localIP = '192.168.254.106'; // change to your local IPV4 address

    final response = await http.post(
      Uri.parse(
        'https://$localIP:8449/WebAssessorWebServices/oauth/token?grant_type=password&username=$username&password=$password',
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token,
      },
    );

    print(response.body);

    if (response.statusCode == 200) {
      return AuthResponse.fromJson(jsonDecode(response.body));
    } else {
      return AuthResponse(message: "Invalid credentials");
    }
  }
}
