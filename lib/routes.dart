import 'landing_screen.dart';
import 'home_page.dart';
import 'package:flutter/material.dart';



//class for routing easy to use and route for using Navigator.pushname
class RouteHandler {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case LandingPage.routeName:
        return MaterialPageRoute(builder: (context) => const LandingPage());
      default:
        return MaterialPageRoute(builder: (context) => HomePage());
    }
  }
}