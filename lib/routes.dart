import 'package:myapp/pages/first_page.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/pages/landing_screen.dart';
import 'package:myapp/pages/second_page.dart';
import 'package:flutter/material.dart';


//class for routing easy to use and route for using Navigator.pushname
class RouteHandler {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case LandingPage.routeName:
        return MaterialPageRoute(builder: (context) => const LandingPage());
        case FirstPage.routeName:
        return MaterialPageRoute(builder: (context) => const FirstPage());
        case SecondPage.routeName:
        return MaterialPageRoute(builder: (context) => const SecondPage());
      default:
        return MaterialPageRoute(builder: (context) => HomePage());
    }
  }
}