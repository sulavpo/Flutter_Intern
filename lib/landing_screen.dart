import 'package:flutter/foundation.dart';
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
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints){
        return Container(
          child: Column(
            children: [
              Expanded(
                flex: 4,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        color: Colors.blueGrey[800],
                      ),
                      Padding(padding: const EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [Expanded(child: Text("Hi\nMorning'n Cameron!",style: textTheme.headline5!.apply(
                              color: Colors.white,
                            )),),
                              Container(
                                width: 140,
                                height: 90,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("lib/img/avatar.png"),
                                ),
                              ),

                            ],
                          ),
                          Positioned(child:Container(
                            width: constraints.maxHeight,
                            height: constraints.maxWidth*0.35,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                            ),
                          )
                          )
                        ],
                      ),)
                    ],
                  )),
              Container(
                width: constraints.maxHeight,
                color: Colors.grey.shade200,
                height: 440,
              )
            ],
          ),
        );
      }),
    );
  }
  }