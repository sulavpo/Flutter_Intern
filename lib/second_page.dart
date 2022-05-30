import 'package:flutter/material.dart';
import 'package:to_do/constants/images.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: GNav(
          backgroundColor: Colors.white,
          color: Colors.grey,
          activeColor: Colors.black,
          tabs: [
            GButton(
              icon: Icons.home,
            ),
            GButton(icon: Icons.compass_calibration),
            GButton(
              icon: Icons.search,
            ),
            GButton(
              icon: Icons.shopping_bag,
            ),
            GButton(
              icon: Icons.account_circle,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'DISCOVERY',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Icon(
                      Icons.auto_awesome_mosaic,
                      size: 40,
                    ),
                  )
                ],
              )),
          Expanded(
              flex: 6,
              child: Column(children: [Expanded(flex:1,child: Padding(
                  padding: const EdgeInsets.fromLTRB(10,0,10,32),
                  child: Container(decoration: BoxDecoration(border: 
                  Border(bottom: BorderSide(color: Color.fromRGBO(33, 33, 33, 1)))),
                  child: TextField(decoration: (new InputDecoration.collapsed(hintText: 'Search',
                  hintStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black))),)),
                )),Expanded(flex:1,child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 15, 10),
                    child: Container(width: 120,height: 30,child: Center(child: Text('New Release',style: TextStyle(color: Colors.white,fontSize: 15),)),
                    decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(20)),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 15, 10),
                    child: Container(child: Text('Men',style: TextStyle(color: Colors.grey,fontSize: 15),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 15, 10),
                    child: Container(child: Text('Women',style: TextStyle(color: Colors.grey,fontSize: 15),),),
                  ),
                  Padding(
                    padding:const EdgeInsets.fromLTRB(10, 0, 15, 10),
                    child: Container(child: Text('Kids',style: TextStyle(color: Colors.grey,fontSize: 15),),),
                  )
                  ],
                  )
                  ),Expanded(flex:6,child: ListView(scrollDirection:Axis.vertical,children: 
                  [Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(width: 350,height: 250,decoration: BoxDecoration(color: Color.fromARGB(255, 245, 238, 238),borderRadius: BorderRadius.circular(20)),
                        child:Stack(children: [Positioned(height:170,width:170,left:100,child: SvgPicture.asset(AppImages.Soe)),Positioned(top: 80,left: 20,right: 0,bottom: 60,
                        child: Text('\$97.88',style: TextStyle(color: Colors.black,fontSize: 25),)),
                        Positioned(top: 185,left:10,child: Text('Nike Air Max SC',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),Positioned(top: 210,left: 10,child: Text("Men's Shoes",style: TextStyle(color: Colors.grey),)),
                        Positioned(right:20,bottom:20,child: Container(child: Icon(Icons.shopping_bag,size: 15,color: Colors.white,),width: 50,height: 50,decoration: BoxDecoration(color:Colors.black,borderRadius: BorderRadius.circular(50)),))],)
                                       ),
                      ),Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(width: 350,height: 250,decoration: BoxDecoration(color: Color.fromARGB(255, 245, 238, 238),borderRadius: BorderRadius.circular(20)),
                        child:Stack(children: [Positioned(height:170,width:170,left:100,child: SvgPicture.asset(AppImages.Soe)),Positioned(top: 80,left: 20,right: 0,bottom: 60,
                        child: Text('\$97.88',style: TextStyle(color: Colors.black,fontSize: 25),)),
                        Positioned(top: 185,left:10,child: Text('Nike Air Max SC',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),Positioned(top: 210,left: 10,child: Text("Men's Shoes",style: TextStyle(color: Colors.grey),)),
                        Positioned(right:20,bottom:20,child: Container(child: Icon(Icons.shopping_bag,size: 15,color: Colors.white,),width: 50,height: 50,decoration: BoxDecoration(color:Colors.black,borderRadius: BorderRadius.circular(50)),))],)
                                       ),
                      ),
                    ],
                  )],))
                  ],
                  )
              ),
        ],
      ),
    );
  }
}
