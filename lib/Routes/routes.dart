import 'package:dummy_firebase/pages/google_signin.dart';
import 'package:dummy_firebase/pages/home_page.dart';
import 'package:dummy_firebase/pages/login_page.dart';
import 'package:dummy_firebase/pages/signup_page.dart';
import 'package:flutter/material.dart';

class RouteHandler {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Object? arguments = settings.arguments;
    switch (settings.name) {
      case LoginPage.routeName:
        return MaterialPageRoute(builder: (context) => const LoginPage());
        //in case to pass value from one page to another page 

      case SignUp.routeName:
        return MaterialPageRoute(
            builder: (context) => SignUp());
                
        case Homepage.routeName:
        return MaterialPageRoute(builder: (context) => Homepage());
         case GogSign.routeName:
        return MaterialPageRoute(builder: (context) => GogSign(arguments: arguments as ScreenArguments,));


      default:
        return MaterialPageRoute(builder: (context) => const LoginPage());
    }
  }
}