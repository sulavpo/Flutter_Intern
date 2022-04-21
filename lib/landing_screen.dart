import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
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
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("\nHi\nMorning'n Cameron!",style: TextStyle(fontSize: 23,color: Colors.white),),
                                        ),
                                      )
                                  ),
                                  Expanded(
                                      flex:1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          width: 70,
                                          height: 70,
                                          child:ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                            ),
                                            child: Image(
                                              fit: BoxFit.fill,
                                              image: AssetImage('asset/img/avatar.png'),
                                            ),
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
                          flex: 1,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [Column(
                                children: [Expanded(
                                  flex: 2,
                                    child: Container(
                                      width:400,
                                        height: 50,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        _buildCard(),
                                        _buildTard(),
                                        _buildWard(),
                                        _buildXard(),
                                        _buildZard()
                                      ],
                                    ),
                                    )
                                ),Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: 400,
                                    height: 50,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(15, 5, 0, 10),
                                          child: Text("Morning'",style: TextStyle(color: Colors.white),)),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(30, 5, 15, 10),
                                          child: Text("Night",style: TextStyle(color: Colors.white),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(27, 5, 15, 10),
                                          child: Text("Music",style: TextStyle(color: Colors.white),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(27, 5,15, 10),
                                          child: Text("Movie",style: TextStyle(color: Colors.white),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(27, 5, 15, 10),
                                          child: Text("Leave",style: TextStyle(color: Colors.white),),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                ],
                                ),
  ]
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
                        _buildDard(),
                        SizedBox(width: 12),
                        _buildVard(),
                        SizedBox(width: 12),
                        _buildNard(),
                        SizedBox(width: 12),
                        _buildMard(),
                        SizedBox(width: 12),
                        _buildQard(),
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

 Widget _buildCard() => Container(
   margin: EdgeInsets.all(5),
      width: 70,
      height: 70,

    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.blueGrey[900],
    ),
    child: Icon(Icons.sunny,color: Colors.yellow,size: 40,),
    );
 Widget _buildTard() => Container(
    margin: EdgeInsets.all(5),
    width: 70,
    height: 70,

    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.blueGrey[900],
    ),
    child: Icon(Icons.shield_moon_rounded,color: Colors.yellow,size: 40,),
  );
  Widget _buildWard() => Container(
    margin: EdgeInsets.all(5),
    width: 70,
    height: 70,

    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.blueGrey[900],
    ),
    child: Icon(Icons.music_note,color: Colors.red,size: 40,),
  );
 Widget _buildXard() => Container(
    margin: EdgeInsets.all(5),
    width: 70,
    height: 70,

    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.blueGrey[900],
    ),
    child: Icon(Icons.movie,color: Colors.blue,size: 40,),
  );
  Widget _buildZard() => Container(
    margin: EdgeInsets.all(5),
    width: 70,
    height: 70,

    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.blueGrey[900],
    ),
    child: Icon(Icons.lock,color: Colors.green,size: 40,),
  );
 Widget _buildDard() => Container(
    margin: EdgeInsets.fromLTRB(40, 45, 0, 60),
    width: 200,
    //height: 70,

    decoration: BoxDecoration(
      image: DecorationImage(image: Image.asset("asset/img/living.png").image,fit: BoxFit.cover),
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
            child: _iconList(),
          )],
      ),
    ),
  );
  Widget _buildVard() => Container(
    margin: EdgeInsets.fromLTRB(10, 45, 0, 60),
    width: 200,
    //height: 70,

    decoration: BoxDecoration(
      image: DecorationImage(image: Image.asset("asset/img/kitchen.png").image,fit: BoxFit.cover),
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
            child: _iconList(),
          )
        ],
      ),
    ),
  );
 Widget _buildNard() => Container(
    margin: EdgeInsets.fromLTRB(10, 45, 0, 60),
    width: 200,
    //height: 70,

    decoration: BoxDecoration(
      image: DecorationImage(image: Image.asset("asset/img/hall.png").image,fit: BoxFit.cover),
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
            child: _iconList(),
          )
        ],
      ),
    ),
  );
  Widget _buildMard() => Container(
    margin: EdgeInsets.fromLTRB(10, 45, 0, 60),
    width: 200,
    //height: 70,
    decoration: BoxDecoration(
      image: DecorationImage(image: Image.asset("asset/img/game.png").image,fit: BoxFit.cover),
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
            child: _iconList(),
          )],
      ),
    ),
  );
  Widget _buildQard() => Container(
    margin: EdgeInsets.fromLTRB(10, 45, 0, 60),
    width: 200,
    //height: 20,
    decoration: BoxDecoration(
      image: DecorationImage(image: Image.asset("asset/img/bedroom.png").image,fit: BoxFit.cover),
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
          child: _iconList(),
        )
        ],
      ),
    ),
  );

   Widget _iconList() => ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          margin: EdgeInsets.all(5),
          width: 40,
          child: Center(child: Icon(Icons.add_reaction_outlined,color: Colors.white,size: 28,)),decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: null,
          border: Border.all(color: Colors.white,width: 2),
        ),),
        Container(
          margin: EdgeInsets.all(5),
          width: 40,
          child: Icon(Icons.call,color: Colors.white,size: 28,),decoration: BoxDecoration(
          border: Border.all(color: Colors.white,width: 2),
          shape: BoxShape.circle,
        ),),
        Container(
          margin: EdgeInsets.all(5),
          width: 40,
          child: Icon(Icons.add_alarm,color: Colors.white,size: 28,),decoration: BoxDecoration(
          border: Border.all(color: Colors.white,width: 2),
          shape: BoxShape.circle,
        ),),
        Container(
          margin: EdgeInsets.all(5),
          width: 40,
          child: Icon(Icons.add_business,color: Colors.white,size: 28,),decoration: BoxDecoration(
          border: Border.all(color: Colors.white,width: 2),
          shape: BoxShape.circle,
        ),),
        Container(
          margin: EdgeInsets.all(5),
          width: 40,
          child: Icon(Icons.add_chart,color: Colors.white,size: 28,),decoration: BoxDecoration(
          border: Border.all(color: Colors.white,width: 2),
          shape: BoxShape.circle,
        ),),


      ],
    );




  }