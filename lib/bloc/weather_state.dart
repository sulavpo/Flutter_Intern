part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitialState extends WeatherState {}

class LoadedWeatherState extends WeatherState {
  final WeatherModel model;

  const LoadedWeatherState({required this.model});
}

class LoadingWeatherState extends WeatherState {}

class LoadingFailedWeatherState extends WeatherState {}
