
import 'package:flutter/material.dart';
import 'package:mohar_app/Pages/google_signin.dart';
import 'package:mohar_app/Pages/home_page.dart';
import 'package:mohar_app/Pages/login_page.dart';
import 'package:mohar_app/Pages/next_page.dart';
import 'package:mohar_app/Pages/selfie.dart';
import 'package:mohar_app/Pages/signup_page.dart';
import 'package:mohar_app/models/next_page_view.dart';

//class for routing easy to use and route for using Navigator.pushname
class RouteHandler {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Object? arguments = settings.arguments;
    switch (settings.name) {
      case LogIn.routeName:
        return MaterialPageRoute(builder: (context) => const LogIn());
      case SignUp.routeName:
        return MaterialPageRoute(builder: (context) => SignUp());
      case NextPage.routeName:
        return MaterialPageRoute(
            builder: (context) => NextPage(
                  arguments: arguments as NextPageViewModel,
                ));
      case SelfieClick.routeName:
        return MaterialPageRoute(
            builder: (context) => SelfieClick(
                  ar: arguments as NextArgument,
                ));
      case HomePage.routeName:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case GogSign.routeName:
        return MaterialPageRoute(
            builder: (context) => GogSign(
                  arguments: arguments as ScreenArguments,
                ));

      default:
        return MaterialPageRoute(builder: (context) => const LogIn());
    }
  }
}
