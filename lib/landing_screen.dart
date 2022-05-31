import 'package:flutter/material.dart';
import 'package:myapp/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'hello',
            style: TextStyle(fontSize: 50, color: Colors.yellow),
          ),
          MaterialButton(
              color: Colors.blue,
              child: Text('Logout'),
              onPressed: () async {
                final SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.remove('token');
               Navigator.pushNamed(context, HomePage());
              })
        ],
      )),
    );
  }
}
