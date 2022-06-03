import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/constants/api_endpoints.dart';
import 'package:myapp/second_page.dart';
import 'package:myapp/constants/images.dart';

List<LogoPart> logoPartList = <LogoPart>[
  LogoPart(
    title: 'Nepal-Kathmandu',
    imageName: AppImages.nepal,
    onTap: () {
      getTime(ApiEndpoints.kathmandu);
    },
  ),
  LogoPart(
    title: 'America',
    imageName: AppImages.america,
    onTap: () {
      getTime(ApiEndpoints.america);
    },
  ),
  LogoPart(
    title: 'India',
    imageName: AppImages.india,
    onTap: () {
      getTime(ApiEndpoints.india);
    },
  ),
  LogoPart(
    title: 'China',
    imageName: AppImages.china,
    onTap: () {
      getTime(ApiEndpoints.japan);
    },
  ),
];

class LogoPart extends StatelessWidget {
  final String title;
  final String imageName;
  final Color color;
  final void Function() onTap;

  const LogoPart(
      {Key? key,
      required this.title,
      required this.imageName,
      this.color = Colors.white,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(23, 120, 50, 50),
        child: Column(
          children: [
            Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(shape: BoxShape.circle, color: color),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: SvgPicture.asset(
                      imageName,
                      fit: BoxFit.fill,
                    ))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(fontSize: 40),
              ),
            )
          ],
        ),
      ),
    );
  }
}
