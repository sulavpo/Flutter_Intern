import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:myapp/landing_screen.dart';
import 'third_page.dart';
import 'second_page.dart';
import 'fourth_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);
  static const String routeName = "/first-page";

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _screen = const [
    ThirdPage(),
    SecondPage(),
    LandingPage(),
    FourthPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        index: selectedIndex,
        backgroundColor: Colors.transparent,
        // key: NavbarKey.getkey(),
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
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          _pageController.jumpToPage(selectedIndex);
        },
        animationCurve: Curves.easeOut,
        //animationDuration: const Duration(milliseconds: 20),
      ),
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
