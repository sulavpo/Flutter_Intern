import 'package:flutter/material.dart';

class MiddlePart extends StatefulWidget {
  const MiddlePart({ Key? key }) : super(key: key);

  @override
  State<MiddlePart> createState() => _MiddlePartState();
}

class _MiddlePartState extends State<MiddlePart> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                );
      
  }
  Widget _buildDard() => Container(
        margin: EdgeInsets.fromLTRB(40, 45, 0, 60),
        width: 200,
        //height: 70,

        decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset("asset/img/living.png").image,
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 225, 0, 0),
          width: 20,
          //height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: Colors.grey.withOpacity(0.6),
          ),
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    "Living\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t1/5",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
              Expanded(
                flex: 2,
                child: _iconList(),
              )
            ],
          ),
        ),
      );
  Widget _buildVard() => Container(
        margin: EdgeInsets.fromLTRB(10, 45, 0, 60),
        width: 200,
        //height: 70,

        decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset("asset/img/kitchen.png").image,
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 225, 0, 0),
          width: 20,
          //height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: Colors.grey.withOpacity(0.6),
          ),
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    "Kitchen\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t2/5",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
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
          image: DecorationImage(
              image: Image.asset("asset/img/hall.png").image,
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 225, 0, 0),
          width: 20,
          //height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: Colors.grey.withOpacity(0.6),
          ),
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    "Hall\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t3/5",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
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
          image: DecorationImage(
              image: Image.asset("asset/img/game.png").image,
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),

        child: Container(
          margin: EdgeInsets.fromLTRB(0, 225, 0, 0),
          width: 20,
          //height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: Colors.grey.withOpacity(0.6),
          ),
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    "Game\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t4/5",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
              Expanded(
                flex: 2,
                child: _iconList(),
              )
            ],
          ),
        ),
      );
  Widget _buildQard() => Container(
        margin: EdgeInsets.fromLTRB(10, 45, 0, 60),
        width: 200,
        //height: 20,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset("asset/img/bedroom.png").image,
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
          //color: Colors.white,
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 225, 0, 0),
          width: 20,
          //height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: Colors.grey.withOpacity(0.6),
          ),
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    "Bedroom\t\t\t\t\t\t\t\t\t\t\t5/5",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
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
            child: Center(
                child: Icon(
              Icons.add_reaction_outlined,
              color: Colors.white,
              size: 28,
            )),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: null,
              border: Border.all(color: Colors.white, width: 2),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            width: 40,
            child: Icon(
              Icons.call,
              color: Colors.white,
              size: 28,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              shape: BoxShape.circle,
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            width: 40,
            child: const Icon(
              Icons.add_alarm,
              color: Colors.white,
              size: 28,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              shape: BoxShape.circle,
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            width: 40,
            child: const Icon(
              Icons.add_business,
              color: Colors.white,
              size: 28,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              shape: BoxShape.circle,
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            width: 40,
            child: Icon(
              Icons.add_chart,
              color: Colors.white,
              size: 28,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              shape: BoxShape.circle,
            ),
          ),
        ],
      );

}