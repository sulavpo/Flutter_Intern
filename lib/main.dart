import 'package:flutter/material.dart';
import 'package:new_ui_app/landing_screen.dart';

void main() {
  runApp(const NewApp());
}

class NewApp extends StatefulWidget {
  const NewApp({ Key? key }) : super(key: key);

  @override
  State<NewApp> createState() => _NewAppState();
}

class _NewAppState extends State<NewApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     
     initialRoute: 'simplePage',
      routes: {'simplePage': (context)=>const LandingScreen()},
      
    );
  }
}
