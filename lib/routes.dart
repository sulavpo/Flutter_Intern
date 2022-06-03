import 'landing_screen.dart';
import 'home_page.dart';
import 'package:flutter/material.dart';
import 'first_page.dart';
import 'second_page.dart';
import 'fourth_page.dart';


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
        case FourthPage.routeName:
        return MaterialPageRoute(builder: (context) => const FourthPage());
      default:
        return MaterialPageRoute(builder: (context) => HomePage());
    }
  }
}