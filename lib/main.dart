import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mohar_app/Pages/login_page.dart';

import 'Routes/route.dart';

void main() async {
  // it initalize the native code
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
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteHandler.generateRoute,
      initialRoute: LogIn.routeName,
    );
  }
}
