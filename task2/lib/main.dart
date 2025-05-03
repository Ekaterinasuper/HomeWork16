import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather_screen.dart';
import 'package:weather/weather_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
          create: (context) => WeatherBloc(),
          child: Scaffold(
            body: WeatherScreen(),
          ),
      ),
    );
  }
}



