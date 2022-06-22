import 'package:ecommerce/Pages/home_page.dart';
import 'package:ecommerce/Pages/login_page.dart';
import 'package:ecommerce/Pages/next_page.dart';
import 'package:ecommerce/Pages/selfie.dart';
import 'package:ecommerce/Pages/signup_page.dart';
import 'package:flutter/material.dart';

//class for routing easy to use and route for using Navigator.pushname
class RouteHandler {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Object? arguments = settings.arguments;
    switch (settings.name) {
      case LogIn.routeName:
        return MaterialPageRoute(builder: (context) => const LogIn());
      case SignUp.routeName:
        return MaterialPageRoute(
            builder: (context) => SignUp(
                  arguments: arguments as ScreenArguments,
                ));
      case NextPage.routeName:
        return MaterialPageRoute(builder: (context) => const NextPage());
      case SelfieClick.routeName:
        return MaterialPageRoute(builder: (context) => const SelfieClick());
      case HomePage.routeName:
        return MaterialPageRoute(builder: (context) => const HomePage());

      default:
        return MaterialPageRoute(builder: (context) => const LogIn());
    }
  }
}
