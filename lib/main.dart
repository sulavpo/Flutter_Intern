import 'package:flutter/material.dart';
import 'package:ui/landing_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 1,
            shape: CircleBorder(),
            minimumSize: Size.square(80),
          )
        )
      ),
      initialRoute: 'simplePage',
      routes: {'simplePage': (context)=>LandingScreen()},
    );
  }
}
