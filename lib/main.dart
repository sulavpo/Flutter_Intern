import 'package:dummy_firebase/Routes/routes.dart';
import 'package:dummy_firebase/pages/home_page.dart';
import 'package:dummy_firebase/pages/login_page.dart';
import 'package:dummy_firebase/pages/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: LoginPage.routeName,
      onGenerateRoute: RouteHandler.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
