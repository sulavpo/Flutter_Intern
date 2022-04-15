import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
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
      backgroundColor: Colors.blueGrey[700],
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
                                      flex:3,
                                      child: Container(decoration: BoxDecoration(
                                        //color: Colors.red
                                      ),
                                        child: Text("\nHi\nMorning'n Cameron!",style: TextStyle(fontSize: 23,color: Colors.white),),
                                      )
                                  ),
                                  Expanded(
                                      flex:1,
                                      child: SizedBox(
                                        width: 70,
                                        height: 70,
                                        child:ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                          ),
                                          child: Image(
                                            fit: BoxFit.fill,
                                            image: AssetImage('lib/img/avatar.png'),
                                          ),
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
                            child: Container(
                              height:50,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  buildCard(),
                                  SizedBox(width: 12),
                                 // Positioned(child: Text("Hello"),),
                                  buildTard(),
                                  SizedBox(width: 12),
                                  buildWard(),
                                  SizedBox(width: 12),
                                  buildXard(),
                                  SizedBox(width: 12),
                                  buildZard(),
                                  SizedBox(width: 12),
                                ],
                              ),
                              decoration: BoxDecoration(
                                //color: Colors.red
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
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        buildDard(),
                        SizedBox(width: 12),
                        // Positioned(child: Text("Hello"),),
                        buildVard(),
                        SizedBox(width: 12),
                        buildNard(),
                        SizedBox(width: 12),
                        buildMard(),
                        SizedBox(width: 12),
                        buildQard(),
                        SizedBox(width: 12),
                      ],
                    ),

                    decoration: BoxDecoration(
                        color: Colors.blueGrey[900],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )
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

  buildCard() => Container(
    margin: EdgeInsets.fromLTRB(9, 10, 0, 35),
      width: 61,
      height: 0,

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.blueGrey[900],
    ),
    child: Column(
      children: [
        Icon(Icons.sunny,color: Colors.yellow,size: 50,),
        //Text("Morning'",style: TextStyle(fontSize: 5,color: Colors.white,))
      ],
    ),
    );
  buildTard() => Container(
    margin: EdgeInsets.fromLTRB(4, 10, 0, 35),
    width: 61,
    height: 0,

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40),
      color: Colors.blueGrey[900],
    ),
    child: Column(
      children: [
        Icon(Icons.shield_moon_rounded,color: Colors.yellow,size: 50,),
        //Text("Night'",style: TextStyle(fontSize: 5,color: Colors.white,))
      ],
    ),
  );
  buildWard() => Container(
    margin: EdgeInsets.fromLTRB(4, 10, 0, 35),
    width: 61,
    height: 0,

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40),
      color: Colors.blueGrey[900],
    ),
    child: Column(
      children: [
        Icon(Icons.music_note,color: Colors.red,size: 50,),
        //Text("Music",style: TextStyle(fontSize: 5,color: Colors.white,))
      ],
    ),
  );
  buildXard() => Container(
    margin: EdgeInsets.fromLTRB(4, 10, 0, 35),
    width: 61,
    height: 0,

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.blueGrey[900],
    ),
    child: Column(
      children: [
        Icon(Icons.movie,color: Colors.blue,size: 50,),
        //Text("Movie",style: TextStyle(fontSize: 5,color: Colors.white,))
      ],
    ),
  );
  buildZard() => Container(
    margin: EdgeInsets.fromLTRB(4, 10, 0, 35),
    width: 61,
    height: 0,

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.blueGrey[900],
    ),
    child: Column(
      children: [
        Icon(Icons.lock,color: Colors.green,size: 50,),
        //Text("Leave",style: TextStyle(fontSize: 5,color: Colors.white,))
      ],
    ),
  );
  buildDard() => Container(
    margin: EdgeInsets.fromLTRB(40, 45, 0, 60),
    width: 200,
    //height: 70,
    child:ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image(
        fit: BoxFit.fill,
        image: AssetImage('lib/img/avatar.png'),
      ),
    ),

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
  );
  buildVard() => Container(
    margin: EdgeInsets.fromLTRB(10, 45, 0, 60),
    width: 200,
    //height: 70,
    child:ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image(
        fit: BoxFit.fill,
        image: AssetImage('lib/img/avatar.png'),
      ),
    ),

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
  );
  buildNard() => Container(
    margin: EdgeInsets.fromLTRB(10, 45, 0, 60),
    width: 200,
    //height: 70,
    child:ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image(
        fit: BoxFit.fill,
        image: AssetImage('lib/img/avatar.png'),
      ),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
  );
  buildMard() => Container(
    margin: EdgeInsets.fromLTRB(10, 45, 0, 60),
    width: 200,
    //height: 70,
    child:ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image(
        fit: BoxFit.fill,
        image: AssetImage('lib/img/avatar.png'),
      ),
    ),

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
  );
  buildQard() => Container(
    margin: EdgeInsets.fromLTRB(10, 45, 0, 60),
    width: 200,
    //height: 20,
    child:ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image(
        fit: BoxFit.fill,
        image: AssetImage('lib/img/avatar.png'),
      ),
    ),

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
  );
  }