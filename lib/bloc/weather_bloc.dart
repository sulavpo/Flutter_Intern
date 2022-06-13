import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../http/weather_repo.dart';
import '../model/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitialState()) {
    on<FetchWeatherEvent>((event, emit) async {
      WeatherModel? model;
      emit(LoadingWeatherState());
      model = await WeatherRepo().getWeather(cityname: event.cityName);
      print(model);
      emit(LoadedWeatherState(model: model!));
    });
  }
}
