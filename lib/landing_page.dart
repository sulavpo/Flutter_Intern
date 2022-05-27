import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/constants/images.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(flex: 1, child: Container()),
                   Expanded(
                    flex: 1,
                    child: SvgPicture.asset(AppImages.tick),
                  ),
                   Expanded(
                      child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 35, 10, 10),
                    child: SvgPicture.asset(AppImages.heart),
                  ))
                ],
              )),
          Expanded(
            flex: 5,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SvgPicture.asset(AppImages.shoe),
              const Padding(
                padding: EdgeInsets.fromLTRB(7, 0, 0, 0),
                child: Text(
                  "Men's Shoes",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(7, 0, 0, 0),
                child: Text(
                  'NIKE AIR ZOOM S 23',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(7, 0, 0, 0),
                child: Text(
                  'color',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 111, 127, 136)),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 215, 234, 243)),
                  )
                ],
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Size',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Expanded(flex: 2, child: Container()),
                  Expanded(
                      flex: 1,
                      child: Row(
                        children: const [
                      Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Text('Uk', style: TextStyle(fontSize: 15)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Text('US',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Text('EU',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 240, 231, 231))),
                      )
                        ],
                      ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 70,
                        margin: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 250, 242, 242)),
                        child: const Center(
                            child: Text(
                          '8.5',
                          style: TextStyle(fontSize: 15),
                        )),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                          height: 70,
                          margin: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 250, 242, 242)),
                          child: const Center(
                              child: Text(
                            '9',
                            style: TextStyle(fontSize: 15),
                          )))),
                  Expanded(
                      flex: 1,
                      child: Container(
                          height: 70,
                          margin: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black),
                          child: const Center(
                              child: Text(
                            '9.5',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )))),
                  Expanded(
                      flex: 1,
                      child: Container(
                          height: 70,
                          margin: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 250, 242, 242)),
                          child: const Center(
                              child: Text(
                            '10',
                            style: TextStyle(fontSize: 15),
                          )))),
                  Expanded(
                      flex: 1,
                      child: Container(
                          height: 70,
                          margin: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 250, 242, 242)),
                          child: const Center(
                              child: Text(
                            '10.5',
                            style: TextStyle(fontSize: 15),
                          ))))
                ],
              )
            ]),
          ),
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(9.0),
                      child: Text(
                        '\$143.5',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (() {
                      setState(() {
    
                      });
                    }),
                    child: Container(
                      width: 170,
                      height: 60,
                      margin: const EdgeInsets.only(right: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black),
                      child: const Center(
                          child: Text('Add to Bag',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20))),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
