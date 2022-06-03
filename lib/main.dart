import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'first_page.dart';
import 'home_page.dart';
import 'routes.dart';

void main() async {


//get string token from api and storing it in token variable(i.e which is token is a stringwhich can be null)
//?-means it can be null & !- means it is forcefully null

  WidgetsFlutterBinding.ensureInitialized();

  //_SharedPreference is await bez it can take time(i.e async)

  final SharedPreferences _pref = await SharedPreferences.getInstance();
  String? token = _pref.getString("token");
  runApp(MyApp(

    //here token is token

    token: token,
  ));
}


//when we declare navigator key globally no need to declare context everywhere

class AppSettings {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

class MyApp extends StatelessWidget {

  // class myapp is calling and constructor

  final String? token;
  const MyApp({Key? key, this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lofo',
      debugShowCheckedModeBanner: false,
      navigatorKey: AppSettings.navigatorKey,

      //go to route handler (i.e routes.dart page)

      onGenerateRoute: RouteHandler.generateRoute,

      //when we open app is the token is there in sharedpreference open Landing page if not go to Home page

     initialRoute: token != null ? FirstPage.routeName : HomePage.routeName,
     
      //home: token != null ? const LandingPage() : const HomePage(),
    );
  }
}
