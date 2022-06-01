import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'landing_screen.dart';
import 'home_page.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences _pref = await SharedPreferences.getInstance();
  String? token = _pref.getString("token");
  runApp(MyApp(
    token: token,
  ));
}

class MyApp extends StatelessWidget {
  final String? token;
  const MyApp({Key? key, this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lofo',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteHandler.generateRoute,
      initialRoute: token != null ? LandingPage.routeName : HomePage.routeName,
      //home: token != null ? const LandingPage() : const HomePage(),
    );
  }
}
