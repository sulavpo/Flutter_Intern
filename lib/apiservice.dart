import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/pages/first_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  Future<LoginApiResponse?> apiCallLogin(
      Map<String, dynamic> param, context) async {
    var url = Uri.parse('https://reqres.in/api/login');
    LoginApiResponse? loginResponse;
    http.Response? response = await http.post(url, body: param);

    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    //if the statusCode from respond is 200 

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      //caling LoginResponse and saving token data inside token and error in error pulling api

      loginResponse =
          LoginApiResponse(token: data["token"], error: data["error"]);
          //
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', data['token']);

      //routing or navigating to Langing page

      Navigator.pushNamed(context, FirstPage.routeName);
    } else {

       //if the statusCode from respond isnot  200 alert message

      await _showDialog(context);
    }
    return loginResponse;
  }
}

//class(model)

class LoginApiResponse {
  final String? token;
  final String? error;

  //constructor 

  LoginApiResponse({this.token, this.error});
}


//for alert message

_showDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Error:User credentials wrong",
            style: TextStyle(color: Colors.red, fontSize: 18),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("OK"),
              onPressed: () {

                //Navigator.pushNamed(context, "/screen1");
                
                Navigator.pop(context);
              },
            ),
          ],
        );
      });
}
