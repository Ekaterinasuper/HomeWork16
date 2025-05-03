import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather_event.dart';
import 'package:weather/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        await Future.delayed(Duration(seconds: 1));

        final weather = WeatherCity(
            city: event.city,
            weatherr: 'sunny',
      );

        if (weather.city == 'Amsterdam') {
          throw Exception('Ошибочка, введите город');
        }

        emit(WeatherLoaded(weather));
      } catch (e) {
        emit(WeatherError(e.toString()));
      }
    });
  }
}

//   @override
//   Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
//     if (event is FetchWeather) {
//       yield WeatherLoading();
//       try {
//         await Future.delayed(Duration(seconds: 2));
//
//         yield WeatherLoaded('Погода в городе ${.city}: солнечно, 25 граудсов' as FetchWeather);
//       } catch (e) {
//         yield WeatherError('не удалось загрузить данные о погоде');
//
//       }
//     }
//   }
// }
