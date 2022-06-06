import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/images.dart';


List<ScrollPart> scrollPartList = <ScrollPart>[
  ScrollPart(

  //part 1
    title: 'Nepal-Kathmandu',
    imageName: AppImages.nepal,
    onTap: () {
    },
  ),
  ScrollPart(

    //part 2
    title: 'America-New York',
    imageName: AppImages.america,
    onTap: () {
    },
  ),
  ScrollPart(

    //part 3
    title: 'India-Kolkata',
    imageName: AppImages.india,
    onTap: () {
    },
  ),
  ScrollPart(


    //part 4
    title: 'Hong Kong',
    imageName: AppImages.hong,
    onTap: () {
    },
  ),
];

//LogoPart class where tittle,imageName,color and function is initalized 
//as String,String,Color and void Function

class ScrollPart extends StatelessWidget {
  final String title;
  final String imageName;
  final Color color;
  final void Function() onTap;

  //constructor

  const ScrollPart(
      {Key? key,
      required this.title,
      required this.imageName,
      this.color = Colors.white,
      required this.onTap})
      : super(key: key);

      //what and How to diaplay?


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(50, 200, 50, 50),
        child: Column(
          children: [
            Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(shape: BoxShape.rectangle, color: color),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SvgPicture.asset(
                      //variable imageName is shown
                      
                      imageName,
                      fit: BoxFit.fill,
                    ))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}