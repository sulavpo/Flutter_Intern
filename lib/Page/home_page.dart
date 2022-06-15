import 'package:blco_api/Page/clock_page.dart';
import 'package:blco_api/Page/weather_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_search_bar/flutter_search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var cityController = TextEditingController();
  int selectedIndex = 0;

//data type page controller

  final PageController _pageController = PageController();
  final List<Widget> _screen = [
    const ClockPage(),
    const WeatherPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // backgroundColor: const Color.fromARGB(255, 164, 211, 235),
      bottomNavigationBar: CurvedNavigationBar(
        color: Color.fromRGBO(55, 71, 79, 1),
        //selected index active garna yo use vaxa

        index: selectedIndex,
        backgroundColor:  Colors.transparent,
        items: const [
          Icon(
            Icons.watch,
            size: 20,
            color: Colors.white,
          ),
          Icon(
            Icons.sunny_snowing,
            size: 20,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          _pageController.jumpToPage(selectedIndex);
        },
        animationCurve: Curves.easeOut,
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
