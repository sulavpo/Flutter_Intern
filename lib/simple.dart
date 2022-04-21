import 'package:flutter/material.dart';

class simple extends StatefulWidget {
  const simple({Key? key}) : super(key: key);

  @override
  State<simple> createState() => _simpleState();
}

class _simpleState extends State<simple> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 500,
          height: 800,
          color: Colors.grey,

          child: Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              Positioned(
                top: 6,
                right: 6,
                child:Container(
                  width: 210,
                  height: 200,
                  color: Colors.green,
                ),
              ),
              Positioned(
                  top: 6,
                  left: 6,
                  child: Container(
                    width: 135,
                    height: 490,
                    color: Colors.indigo,
                  )
              ),
              Positioned(
                bottom: 8,
                right: 6,
                child: Container(
                  width: 135,
                  height: 505,
                  color: Colors.indigo,
                ),
              ),
              Positioned(
                  top: 205,
                  left: 140,
                  child: Container(
                    width: 100,
                    height: 285,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.yellowAccent.withOpacity(0.2),width: 4),

                    ),
                  )
              ),
              Positioned(
                  top: 223,
                  left: 155,
                  child: Container(
                    width: 70,
                    height: 70,
                    color: Colors.red,
                  )
              ),
              Positioned(
                  top: 310,
                  left: 155,
                  child: Container(
                    width: 70,
                    height: 70,
                    color: Color(0xff00b8d4),
                  )
              ),
              Positioned(
                  top: 400,
                  left: 155,
                  child: Container(
                    width: 70,
                    height: 70,
                    color: Colors.green,
                  )
              ),
              Positioned(
                  bottom: 8,
                  left: 6,
                  child: Container(
                    width: 235,
                    height: 223,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.red,width: 4),

                    ),
                  )
              ),
              Positioned(
                  bottom: 90,
                  left: 90,
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.yellowAccent.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  )
              ),
              Positioned(
                  bottom: 30,
                  right: 14,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.yellowAccent.withOpacity(0.2),width: 4),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  )
              ),
              Positioned(
                  top: 30,
                  left: 14,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  )
              ),
              Positioned(
                  top: 340,
                  left: 12,
                  child:
                  Container(
                    height: 125,
                    width: 125,
                    child: Image.asset('asset/icon/emojis.png'),
                  )
              ),
              Positioned(
                  top: 25,
                  right: 155,
                  child:
                  Card(
                    color:Colors.white,
                    child: Text('Text 1',style: TextStyle(fontSize: 20)),
                  )
              ),
              Positioned(
                top: 180,
                right: 20,
                child:Text('TEXT 3',style: TextStyle(fontSize: 20,color: Colors.white)),
              ),

              Positioned(
                top: 95,
                right: 105,
                child:
                Transform.rotate(angle: 50,
                  child: Card(
                    color:Colors.yellowAccent.withOpacity(0.8),
                    child: Text('TEXT 2',style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }
}