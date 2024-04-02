import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterController {
  Future<bool> registerUser({
    required String email,
    required String password,
    required String name,
    required String location,
    required String status,
  }) async {
    var url = Uri.parse('http://localhost:8183/api/users');
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email': email,
        'password': password,
        'name': name,
        'location': location,
        'status': status,
      }),
    );

    return response.statusCode == 200;
  }
}
