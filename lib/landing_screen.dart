import 'package:flutter/material.dart';
import 'package:myapp/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  final String? token;
  const LandingPage({Key? key, this.token}) : super(key: key);
  static const String routeName = "/landing-page";
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String? accessToken = '';
  //to use in the widget tree
  shared() async {
    final SharedPreferences _pref = await SharedPreferences.getInstance();
    String? token = _pref.getString("token");
    accessToken = token;
    setState(() {
      
    });
  }

  @override
  void didChangeDependencies() {
    shared();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LandingPage')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'hello $accessToken',
            style: TextStyle(fontSize: 50, color: Colors.yellow),
          ),
          MaterialButton(
              color: Colors.blue,
              child: const Text('Logout'),
              onPressed: () async {
                final SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.remove('token');
                Navigator.pushNamed(context, HomePage.routeName);
              })
        ],
      )),
    );
  }
}
