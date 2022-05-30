import 'dart:convert';

import 'package:api_project/model.dart';
import 'package:http/http.dart' as http;

class DummyServices {
  String url = "https://catfact.ninja/fact";
  Future<DummyModel> getData() async {
    http.Response? response = await http.get(Uri.parse(url));
    var body = jsonDecode(response.body) as Map<String, dynamic>;
    var model = DummyModel.fromJson(body);
    return model;
  }
}
