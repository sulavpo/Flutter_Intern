import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/pages/page_view.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

//takes index, and finds remainder when dividing index by the given list length
//mainly list laie loop garna use huna extension

extension LoopList<T> on List {
  T loop(int index) => this[index % this.length];
}

class _ThirdPageState extends State<ThirdPage> {
  //decleration of pagecontroller  where initial page is 0

  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  bool end = false;
  @override
  void initState() {
    super.initState();

    //use for animation

    Timer.periodic(const Duration(seconds: 2), (Timer timer) {

      //to go to next page automatically

      _currentPage++;

      //animation part use for Duration and automatically go to next page


      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.linear,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: PageView.builder(
          controller: _pageController,
          itemBuilder: (context, index) {

          //  using above loop extension with and calling scrollPArtlist
          
            return scrollPartList.loop(index);
          }),
    );
  }
}
