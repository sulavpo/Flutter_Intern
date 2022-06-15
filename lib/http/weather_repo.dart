import 'package:blco_api/model/failure_model.dart';
import 'package:blco_api/model/weather_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherRepo {
  Future<Either<WeatherModel, FailureModel>> getWeather(
      {required String cityname}) async {
    WeatherModel? model;
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$cityname&APPID=43ea6baaad7663dc17637e22ee6f78f2"));
    
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202){
      var data = jsonDecode(response.body);
      model = WeatherModel.fromJson(data);
      return Left(model);
    }
    return Right(FailureModel(message: "City/Country Not Found"));
  }
}
