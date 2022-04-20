import 'package:flutter/material.dart';
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
                              child:Row(
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
                      borderRadius:const BorderRadius.only(
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
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
          child: GNav(
            backgroundColor: Color(0xFF263238),
            color: Colors.grey,
            activeColor: Colors.grey,
            tabBackgroundColor: Color(0xFF8E24AA),
            gap: 8,
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            tabs: [
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
        Text("Morning'",style: TextStyle(fontSize: 5,color: Colors.white))
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

    decoration: BoxDecoration(
      image: DecorationImage(image: Image.asset("lib/img/living.png").image,fit: BoxFit.cover),
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    child: Container(
      margin: EdgeInsets.fromLTRB(0, 225, 0, 0),
      width: 20,
      //height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),),
        color: Colors.grey.withOpacity(0.6),
      ),
      child: Column(
        children: [
          Expanded(
              flex:1,
              child: Text("Living\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t1/5",style: TextStyle(fontSize: 20,color:Colors.white),)),
          Expanded(
            flex: 2,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(6, 10, 5, 15),
                  width: 40,
                  child: Icon(Icons.add_reaction_outlined,color: Colors.white,size: 28,),decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),),
                Container(
                  margin: EdgeInsets.fromLTRB(6, 10, 5, 15),
                  width: 40,
                  child: Icon(Icons.call,color: Colors.white,size: 28,),decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),),
                Container(
                  margin: EdgeInsets.fromLTRB(6, 10, 5, 15),
                  width: 40,
                  child: Icon(Icons.add_alarm,color: Colors.white,size: 28,),decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),),
                Container(
                  margin: EdgeInsets.fromLTRB(6, 10, 5, 15),
                  width: 40,
                  child: Icon(Icons.add_business,color: Colors.white,size: 28,),decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),),
                Container(
                  margin: EdgeInsets.fromLTRB(6, 10, 5, 15),
                  width: 40,
                  child: Icon(Icons.add_chart,color: Colors.white,size: 28,),decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),),


              ],
            ),)],
      ),
    ),
  );
  buildVard() => Container(
    margin: EdgeInsets.fromLTRB(10, 45, 0, 60),
    width: 200,
    //height: 70,

    decoration: BoxDecoration(
      image: DecorationImage(image: Image.asset("lib/img/kitchen.png").image,fit: BoxFit.cover),
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    child: Container(
      margin: EdgeInsets.fromLTRB(0, 225, 0, 0),
      width: 20,
      //height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),),
        color: Colors.grey.withOpacity(0.6),
      ),
      child: Column(
        children: [
          Expanded(
              flex:1,
              child: Text("Kitchen\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t2/5",style: TextStyle(fontSize: 20,color:Colors.white),)),
          Expanded(
            flex: 2,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(6, 10, 5, 15),
                  width: 40,
                  child: Icon(Icons.add_reaction_outlined,color: Colors.white,size: 28,),decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),),
                Container(
                  margin: EdgeInsets.fromLTRB(6, 10, 5, 15),
                  width: 40,
                  child: Icon(Icons.call,color: Colors.white,size: 28,),decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),),
                Container(
                  margin: EdgeInsets.fromLTRB(6, 10, 5, 15),
                  width: 40,
                  child: Icon(Icons.add_alarm,color: Colors.white,size: 28,),decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),),
                Container(
                  margin: EdgeInsets.fromLTRB(6, 10, 5, 15),
                  width: 40,
                  child: Icon(Icons.add_business,color: Colors.white,size: 28,),decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),),
                Container(
                  margin: EdgeInsets.fromLTRB(6, 10, 5, 15),
                  width: 40,
                  child: Icon(Icons.add_chart,color: Colors.white,size: 28,),decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),),


              ],
            ),)],
      ),
    ),
  );
  buildNard() => Container(
    margin: EdgeInsets.fromLTRB(10, 45, 0, 60),
    width: 200,
    //height: 70,

    decoration: BoxDecoration(
      image: DecorationImage(image: Image.asset("lib/img/hall.png").image,fit: BoxFit.cover),
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    child: Container(
      margin: EdgeInsets.fromLTRB(0, 225, 0, 0),
      width: 20,
      //height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),),
        color: Colors.grey.withOpacity(0.6),
      ),
      child: Column(
        children: [
          Expanded(
              flex:1,
              child: Text("Hall\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t3/5",style: TextStyle(fontSize: 20,color:Colors.white),)),
          Expanded(
            flex: 2,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(6, 10, 5, 15),
                  width: 40,
                  child: Icon(Icons.add_reaction_outlined,color: Colors.white,size: 28,),decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),),
                Container(
                  margin: EdgeInsets.fromLTRB(6, 10, 5, 15),
                  width: 40,
                  child: Icon(Icons.call,color: Colors.white,size: 28,),decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),),
                Container(
                  margin: EdgeInsets.fromLTRB(6, 10, 5, 15),
                  width: 40,
                  child: Icon(Icons.add_alarm,color: Colors.white,size: 28,),decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),),
                Container(
                  margin: EdgeInsets.fromLTRB(6, 10, 5, 15),
                  width: 40,
                  child: Icon(Icons.add_business,color: Colors.white,size: 28,),decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),),
                Container(
                  margin: EdgeInsets.fromLTRB(6, 10, 5, 15),
                  width: 40,
                  child: Icon(Icons.add_chart,color: Colors.white,size: 28,),decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),),


              ],
            ),)],
      ),
    ),
  );
  buildMard() => Container(
    margin: EdgeInsets.fromLTRB(10, 45, 0, 60),
    width: 200,
    //height: 70,
    decoration: BoxDecoration(
      image: DecorationImage(image: Image.asset("lib/img/game.png").image,fit: BoxFit.cover),
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),


    child: Container(
      margin: EdgeInsets.fromLTRB(0, 225, 0, 0),
      width: 20,
      //height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),),
        color: Colors.grey.withOpacity(0.6),
      ),
      child: Column(
        children: [
          Expanded(
              flex:1,
              child: Text("Game\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t4/5",style: TextStyle(fontSize: 20,color:Colors.white),)),
          Expanded(
            flex: 2,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(6, 10, 5, 15),
                  width: 40,
                  child: Icon(Icons.add_reaction_outlined,color: Colors.white,size: 28,),decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),),
                Container(
                  margin: EdgeInsets.fromLTRB(6, 10, 5, 15),
                  width: 40,
                  child: Icon(Icons.call,color: Colors.white,size: 28,),decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),),
                Container(
                  margin: EdgeInsets.fromLTRB(6, 10, 5, 15),
                  width: 40,
                  child: Icon(Icons.add_alarm,color: Colors.white,size: 28,),decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),),
                Container(
                  margin: EdgeInsets.fromLTRB(6, 10, 5, 15),
                  width: 40,
                  child: Icon(Icons.add_business,color: Colors.white,size: 28,),decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),),
                Container(
                  margin: EdgeInsets.fromLTRB(6, 10, 5, 15),
                  width: 40,
                  child: Icon(Icons.add_chart,color: Colors.white,size: 28,),decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),),


              ],
            ),)],
      ),
    ),
  );
  buildQard() => Container(
    margin: EdgeInsets.fromLTRB(10, 45, 0, 60),
    width: 200,
    //height: 20,
    decoration: BoxDecoration(
      image: DecorationImage(image: Image.asset("lib/img/bedroom.png").image,fit: BoxFit.cover),
      borderRadius: BorderRadius.circular(20),
      //color: Colors.white,
    ),
    child: Container(
      margin: EdgeInsets.fromLTRB(0, 225, 0, 0),
      width: 20,
      //height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),),
        color: Colors.grey.withOpacity(0.6),
      ),
      child: Column(
        children: [
          Expanded(
              flex:1,
      child: Text("Bedroom\t\t\t\t\t\t\t\t\t\t\t5/5",style: TextStyle(fontSize: 20,color:Colors.white),)),
        Expanded(
          flex: 2,
          child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(6, 10, 5, 15),
              width: 40,
              child: Icon(Icons.add_reaction_outlined,color: Colors.white,size: 28,),decoration: BoxDecoration(
              border: Border.all(color: Colors.white,width: 2),
              borderRadius: BorderRadius.circular(50),
            ),),
            Container(
              margin: EdgeInsets.fromLTRB(6, 10, 5, 15),
              width: 40,
              child: Icon(Icons.call,color: Colors.white,size: 28,),decoration: BoxDecoration(
              border: Border.all(color: Colors.white,width: 2),
              borderRadius: BorderRadius.circular(50),
            ),),
            Container(
              margin: EdgeInsets.fromLTRB(6, 10, 5, 15),
              width: 40,
              child: Icon(Icons.add_alarm,color: Colors.white,size: 28,),decoration: BoxDecoration(
              border: Border.all(color: Colors.white,width: 2),
              borderRadius: BorderRadius.circular(50),
            ),),
            Container(
              margin: EdgeInsets.fromLTRB(6, 10, 5, 15),
              width: 40,
              child: Icon(Icons.add_business,color: Colors.white,size: 28,),decoration: BoxDecoration(
              border: Border.all(color: Colors.white,width: 2),
              borderRadius: BorderRadius.circular(50),
            ),),
            Container(
              margin: EdgeInsets.fromLTRB(6, 10, 5, 15),
              width: 40,
              child: Icon(Icons.add_chart,color: Colors.white,size: 28,),decoration: BoxDecoration(
              border: Border.all(color: Colors.white,width: 2),
              borderRadius: BorderRadius.circular(50),
            ),),


          ],
        ),)],
      ),
    ),
  );




  }