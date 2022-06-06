import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:myapp/Screens/task_screen.dart';
import 'landing_screen.dart';
import 'third_page.dart';
import 'second_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  //used for route handleing

  static const String routeName = "/first-page";

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  // Inatializing and declaring selectedIndex as value 0

  int selectedIndex = 0;

//data type page controller

  final PageController _pageController = PageController();

// creating list

  final List<Widget> _screen = [
    const ThirdPage(),
    const SecondPage(),
    const LandingPage(),
    const TaskScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,

      //to use backgroundColor = color transparent we need to extendBody = true

      extendBody: true,

// use of bottom NavigationBAr and Curved NAvigation bar (i.e Curved NAvigation bar is package)

      bottomNavigationBar: CurvedNavigationBar(
        //here index is equal to selectedIndex

        index: selectedIndex,
        backgroundColor: Colors.transparent,

        items: const [
          Icon(
            Icons.home,
            size: 20,
          ),
          Icon(
            Icons.lock_clock_rounded,
            size: 20,
          ),
          Icon(
            Icons.settings,
            size: 20,
          ),
          Icon(
            Icons.account_box_rounded,
            size: 20,
          )
        ],
        //  by using page controller.jumpToPage(selectedIndex)

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          _pageController.jumpToPage(selectedIndex);
        },
        animationCurve: Curves.easeOut,
      ),

      //here on pagechange set state as selected index

      body: PageView(
        controller: _pageController,
        children: _screen,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
