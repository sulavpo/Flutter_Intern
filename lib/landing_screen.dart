import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:new_ui_app/header.dart';
import 'package:new_ui_app/logo_scroll.dart';
import 'package:new_ui_app/middle_part.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.blueGrey[900],
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Color(0xFF263238),
            color: Colors.grey,
            activeColor: Colors.grey,
            tabBackgroundColor: Color(0xFF8E24AA),
            gap: 8,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.add,
                text: 'New',
              ),
              GButton(
                icon: Icons.cloud,
                text: 'Cloud',
              ),
              GButton(
                icon: Icons.bar_chart,
                text: 'Status',
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          child: Header(),
                        )),
                    Expanded(
                        flex: 1,
                        child: ListView.builder(
                            itemCount: logoPartList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: LogoPart(
                                  iconName:logoPartList[index].iconName,
                                  title: logoPartList[index].title,
                                  color: _currentindex == index
                                      ? Colors.white
                                      : Color.fromRGBO(38, 50, 56, 1),
                                  onTap: () {
                                    setState(() {
                                      _currentindex = index;
                                    });
                                  },
                                ),
                              );
                            })),
                  ],
                ),
              )),
          Expanded(
              flex: 2,
              child: Container(
                child: MiddlePart(),
              ))
        ],
      ),
      backgroundColor: Colors.blueGrey[700],
    );
  }
}
