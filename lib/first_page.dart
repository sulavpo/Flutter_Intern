import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/constants/images.dart';
import 'package:to_do/second_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                  margin: const EdgeInsets.all(25),
                  child: SvgPicture.asset(AppImages.tick))),
          Expanded(
              flex: 5,
              child: Column(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(90),
                      child: SvgPicture.asset(AppImages.shoe,fit: BoxFit.fill,),
                    ),
                  )),
                  const Text(
                    'Just\n Do it',
                    style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
                  )
                ],
              )),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const SecondPage(),
                        ));
                      });
                    },
                    child: Container(
                      height: 20,
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(40)),
                      child: Row(children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 100),
                          child: Text(
                            'Continues',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white),
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ]),
                    ),
                  )),
                  Expanded(
                    child: Container(),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
