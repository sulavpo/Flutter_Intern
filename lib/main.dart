import 'package:blco_api/Page/home_page.dart';
import 'package:blco_api/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {


  ///jaha pani child hos we can acess block
  ///
  runApp(BlocProvider(
    create: (context) => WeatherBloc(),
    child: MyApp(),
  ));
}

class AppSettings {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: AppSettings.navigatorKey,
      home: const HomePage(),
    );
  }
}
