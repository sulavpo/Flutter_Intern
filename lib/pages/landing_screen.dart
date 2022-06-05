import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'home_page.dart';

class LandingPage extends StatefulWidget {
  //if value is inputed from anothet age declare like this

  final String? token;
  const LandingPage({Key? key, this.token}) : super(key: key);
  static const String routeName = "/landing-page";
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  //declaring   string acessToken which can be null
  //to initialize variable and declare it to same page  decleare like this

  String? accessToken = '';

  //to use in the widget tree

  shared() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString("token");
    //added token value
    accessToken = token;
    setState(() {});
  }

//calling function shared()

  @override
  void didChangeDependencies() {
    shared();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,

      //appBar: AppBar(title: const Text('LandingPage')),

      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            //showing value stored in acessToken varibale

            'hello $accessToken',
            style: const TextStyle(fontSize: 50, color: Colors.yellow),
          ),
          MaterialButton(
              color: Colors.blue,
              child: Column(
                children: const [
                   Text('Logout'),


                  // ToggleSwitch(
                  //   minWidth: 90.0,
                  //   minHeight: 70.0,
                  //   initialLabelIndex: 0,
                  //   cornerRadius: 20.0,
                  //   activeFgColor: Colors.white,
                  //   inactiveBgColor: Colors.grey,
                  //   inactiveFgColor: Colors.white,
                  //   totalSwitches: 2,
                  //   icons: const[
                  // Icons.abc,
                  // Icons.access_alarm_outlined
                  //   ],
                  //   iconSize: 30.0,
                  //   activeBgColors: const [
                  //     [Colors.black45, Colors.black26],
                  //     [Colors.yellow, Colors.orange]
                  //   ],
                  //   animate:
                  //       true, // with just animate set to true, default curve = Curves.easeIn
                  //   curve: Curves
                  //       .bounceInOut, // animate must be set to true when using custom curve
                  //   onToggle: (index) {
                  //     print('switched to: $index');
                  //   },
                  // ),

                  
                ],
              ),
              onPressed: () async {
                //sharedPreference code to remove stored value

                final SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.remove('token');

                //navigate or route to Homepage

                Navigator.pushNamed(context, HomePage.routeName);
              })
        ],
      )),
    );
  }
}
