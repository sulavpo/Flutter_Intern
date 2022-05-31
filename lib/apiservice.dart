import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  Future<LoginApiResponse> apiCallLogin(Map<String, dynamic> param) async {
    var url = Uri.parse('https://reqres.in/api/login');
    var response = await http.post(url, body: param);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    final data = jsonDecode(response.body);
    var res = LoginApiResponse(token: data["token"], error: data["error"]);
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('token', data['token']);

    return res;
  }
}

class LoginApiResponse {
  final String? token;
  final String? error;
  LoginApiResponse({this.token, this.error});
}
