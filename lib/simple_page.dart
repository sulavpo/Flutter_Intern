import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
                            decoration: BoxDecoration(
                                color: Colors.grey, shape: BoxShape.circle),
                          ),
                          margin: EdgeInsets.fromLTRB(5, 4, 0, 0),
                          decoration: BoxDecoration(
                              color: Colors.indigo,
                              border: Border(
                                  left: BorderSide(
                                      width: 4,
                                      color: Colors.yellow.withOpacity(0.7)),
                                  top: BorderSide(
                                      width: 4,
                                      color: Colors.yellow.withOpacity(0.7)))),
                        )),
                    Expanded(
                        flex: 4,
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 4, 150, 0),
                                width: 50,
                                height: 20,
                                child: Text(
                                  "Text1",
                                  style: TextStyle(fontSize: 20),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(3)),
                              ),
                              Transform.rotate(
                                angle: 69,
                                child: Container(
                                  width: 55,
                                  height: 20,
                                  margin: EdgeInsets.fromLTRB(0, 40, 100, 0),
                                  decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(3)),
                                  child: Text(
                                    "TEXT 2",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(150, 50, 5, 1),
                                child: Text(
                                  "TEXT 3",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          margin: EdgeInsets.fromLTRB(0, 4, 4, 0),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border(
                                left: BorderSide(
                                    width: 3,
                                    color: Colors.yellow.withOpacity(0.5)),
                                right: BorderSide(
                                    width: 4,
                                    color: Colors.yellow.withOpacity(0.5)),
                                top: BorderSide(
                                    width: 5,
                                    color: Colors.yellow.withOpacity(0.5))),
                          ),
                        )),
                  ],
                ),
                decoration: BoxDecoration(),
              )),
          Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          child: Column(
                            children: [
                              Expanded(child: Container()),
                              Expanded(
                                  child: Icon(
                                Icons.beach_access,
                                color: Colors.white,
                                size: 100,
                              ))
                            ],
                          ),
                          margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          decoration: BoxDecoration(
                              color: Colors.indigo,
                              border: Border(
                                left: BorderSide(
                                    width: 4,
                                    color: Colors.yellow.withOpacity(0.7)),
                              )),
                        )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                child: Column(children: [
                                  Expanded(
                                      child: Container(
                                    margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        border: Border.all(
                                            color:
                                                Colors.yellow.withOpacity(0.7),
                                            width: 3)),
                                  )),
                                  Expanded(
                                      child: Container(
                                    margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                    decoration: BoxDecoration(
                                        color: Colors.lightBlueAccent),
                                  )),
                                  Expanded(
                                      child: Container(
                                    margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                    decoration:
                                        BoxDecoration(color: Colors.green),
                                  ))
                                ]),
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    border: Border.all(
                                        color: Colors.yellow.withOpacity(0.5),
                                        width: 3)),
                              )),
                              Expanded(
                                  child: Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                decoration: BoxDecoration(
                                  color: Colors.indigo,
                                  border: Border(
                                    top: BorderSide(
                                        width: 4,
                                        color: Colors.yellow.withOpacity(0.7)),
                                    right: BorderSide(
                                        width: 4,
                                        color: Colors.yellow.withOpacity(0.7)),
                                  ),
                                ),
                              ))
                            ],
                          ),
                          //decoration: BoxDecoration(color: Colors.yellow),
                        ))
                  ],
                ),
                decoration: BoxDecoration(
                    //color: Colors.white,
                    ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(50, 50, 50, 50),
                            decoration: BoxDecoration(
                                color: Colors.yellow.withOpacity(0.5),
                                shape: BoxShape.circle),
                          ),
                          //margin: EdgeInsets.fromLTRB(4, 0, 0, 4),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(color: Colors.red, width: 4)),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.yellow.withOpacity(0.3),
                                    width: 4),
                                color: Colors.grey,
                                shape: BoxShape.circle),
                          ),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          decoration: BoxDecoration(
                            color: Colors.indigo,
                          ),
                        ))
                  ],
                ),
                margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                        width: 4, color: Colors.yellow.withOpacity(0.5)),
                    bottom: BorderSide(
                        width: 4, color: Colors.yellow.withOpacity(0.5)),
                    right: BorderSide(
                        width: 4, color: Colors.yellow.withOpacity(0.5)),
                  ),
                  //color: Colors.white,
                ),
              )),
        ],
      ),
    );
  }
}
