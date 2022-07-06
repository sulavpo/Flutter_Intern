// import 'dart:js';

import 'package:firebase_part/Pages/home_page.dart';
import 'package:firebase_part/Pages/landing_screen.dart';
import 'package:firebase_part/Pages/landing_screen2.dart';
import 'package:firebase_part/Pages/signup_page.dart';
import 'package:flutter/material.dart';

class RouteHandler {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Object? arguments = settings.arguments;
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case SignUp.routeName:
        return MaterialPageRoute(builder: (context) => const SignUp());
        case LandingScreen.routeName:
        return MaterialPageRoute(builder: (context) => const LandingScreen());
        case LandingScrn.routeName:
        return MaterialPageRoute(builder: (context) => const LandingScrn());

      default:
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }
}
