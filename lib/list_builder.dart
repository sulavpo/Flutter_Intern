import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/constants/api_endpoints.dart';
import 'package:myapp/pages/second_page.dart';
import 'package:myapp/constants/images.dart';

//making list where its class is LogoPart and is saved in logoPartList

List<LogoPart> logoPartList = <LogoPart>[
  LogoPart(

  //part 1
    title: 'Nepal-Kathmandu',
    imageName: AppImages.nepal,
    onTap: () {
      getTime(ApiEndpoints.kathmandu);
    },
  ),
  LogoPart(

    //part 2
    title: 'America-New York',
    imageName: AppImages.america,
    onTap: () {
      getTime(ApiEndpoints.america);
    },
  ),
  LogoPart(

    //part 3
    title: 'India-Kolkata',
    imageName: AppImages.india,
    onTap: () {
      getTime(ApiEndpoints.india);
    },
  ),
  LogoPart(


    //part 4
    title: 'Hong Kong',
    imageName: AppImages.hong,
    onTap: () {
      getTime(ApiEndpoints.hongkung);
    },
  ),
];

//LogoPart class where tittle,imageName,color and function is initalized 
//as String,String,Color and void Function

class LogoPart extends StatelessWidget {
  final String title;
  final String imageName;
  final Color color;
  final void Function() onTap;

  //constructor

  const LogoPart(
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
                width: 250,
                height: 250,
                decoration: BoxDecoration(shape: BoxShape.circle, color: color),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: SvgPicture.asset(
                      //variable imageName is shown
                      
                      imageName,
                      fit: BoxFit.fill,
                    ))),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                title,
                style: const TextStyle(fontSize: 25),
              ),
            )
          ],
        ),
      ),
    );
  }
}
