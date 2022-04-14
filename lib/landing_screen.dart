import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int myIndex = 0;
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[700]
                    ),
                    child: Column(
                      children: [
                        Expanded(
                            flex:1,
                            child: Container(
                              child: Row(
                                children: [
                                  Expanded(
                                      flex:2,
                                      child: Container(decoration: BoxDecoration(
                                        //color: Colors.red
                                      ),
                                      )
                                  ),
                                  Expanded(
                                      flex:1,
                                      child: Container(decoration: BoxDecoration(
                                       //color: Colors.blue
                                      ),
                                      )
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                //color: Colors.white
                            ),
                            )
                        ),
                        Expanded(
                            flex:1,
                            child: Container(decoration: BoxDecoration(
                                color: Colors.red
                            ),
                            )
                        )
                      ],
                    ),
                  )
              ),
              Expanded(
                flex: 2,
                  child: Container(

                    decoration: BoxDecoration(
                        color: Colors.blueGrey[900]
                    ),
                  )
              ),
            ],
          ),
        ],

      ),
      bottomNavigationBar: Container(
        color: Colors.blueGrey[900],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
          child: GNav(
            backgroundColor: Color(0xFF263238),
            color: Colors.grey,
            activeColor: Colors.grey,
            tabBackgroundColor: Color(0xFF8E24AA),
            gap: 8,
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            tabs: const [
              GButton(icon: Icons.home,text: 'Home',),
              GButton(icon: Icons.add,text: 'New',),
              GButton(icon: Icons.cloud,text: 'Cloud',),
              GButton(icon: Icons.bar_chart,text: 'Status',),
            ],
          ),
        ),
      ),

    );
  }
  }