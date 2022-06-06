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

//Is used for Page view

extension LoopList<T> on List {
  T loop(int index) => this[index % this.length];
}

class _ThirdPageState extends State<ThirdPage> {
  //decleration of pagecontroller  where initial page is 0

  final ScrollController _scrollController = ScrollController();
  // int _currentPage = 0;

  bool end = false;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      double minScrollExtend1 = _scrollController.position.minScrollExtent;
      double maxScrollExtend1 = _scrollController.position.maxScrollExtent;

      animateToMaxMin(maxScrollExtend1, minScrollExtend1, maxScrollExtend1, 10,
          _scrollController);
    });

    //use for animation

    // Timer.periodic(const Duration(seconds: 1), (Timer timer) {
    //to go to next page automatically

    // _currentPage++;

    //animation part use for Duration and automatically go to next page

    // _scrollController.animateToPage(
    //   _currentPage,
    //   duration: const Duration(milliseconds: 1000),
    //   curve: Curves.linear,
    // );
    // });
  }

  animateToMaxMin(double max, double min, double direction, int seconds,
      ScrollController scrollController) {
    scrollController
        .animateTo(direction,
            duration: Duration(seconds: seconds), curve: Curves.linear)
        .then((value) {
      // scrollPartList.addAll(scrollPartList);
      // setState(() {});
      direction = direction == max ? min : max;
      animateToMaxMin(max, min, direction, seconds, _scrollController);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: ListView.builder(
          itemCount: scrollPartList.length,
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          itemBuilder: (context, index) {
            //  using above loop extension with and calling scrollPArtlist

            return scrollPartList[index];
          }),
    );
  }
}
