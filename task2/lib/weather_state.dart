import 'package:weather/weather_event.dart';

class WeatherCity {
  final String city;
  final String weatherr;

  WeatherCity({
    required this.city,
    required this.weatherr,
});
}

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherCity weather;

  WeatherLoaded(this.weather);
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);
}
