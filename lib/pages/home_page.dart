import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({ Key? key }) : super(key: key);
  static const routeName = "/Home-Page";

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      
    );
  }
}