import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather_bloc.dart';
import 'package:weather/weather_event.dart';
import 'package:weather/weather_state.dart';

class WeatherScreen extends StatelessWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(50.0),
      child: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(labelText: 'Введите город'),
          ),
          ElevatedButton(
            onPressed: () {
              final city = controller.text;
              if (city.isNotEmpty) {
                context.read<WeatherBloc>().add(FetchWeather(city));
              }
            },
            child: Text('Узнать погоду'),
          ),
          BlocListener<WeatherBloc, WeatherState>(
            listener: (context, state) {
              if (state is WeatherError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            child: BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoading) {
                  return CircularProgressIndicator();
                } else if (state is WeatherLoaded) {
                  return Column(
                    children: [
                      Text(
                        'Loading',
                        style: TextStyle(color:Colors.amber),
                      ),
                    ],
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
