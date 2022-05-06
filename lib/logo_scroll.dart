import 'package:flutter/material.dart';

 List<LogoPart> logoPartList = <LogoPart>[

	LogoPart( 
		title:'Sunny',
		iconName:Icons.sunny,
    onTap:(){
    } ,
	),
LogoPart(
		title:'Night',
		iconName:Icons.shield_moon,
    onTap:(){} ,
	),
LogoPart(
		title:'Music',
		iconName:Icons.note,
    onTap:(){} ,
	),
  LogoPart(
		title:'Movie',
		iconName:Icons.movie,
    onTap:(){} ,
	),
  LogoPart(
		title:'Leave',
		iconName:Icons.lock,
    onTap:(){} ,
	),
];


class LogoPart extends StatelessWidget {
  final String title;
  final IconData iconName;
  final Color color;
  final void Function() onTap;

  const LogoPart(
      {Key? key,
      required this.title,
      required this.iconName,
      this.color = Colors.white,required this.onTap})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            child: Icon(
             iconName,
             size: 50,
             color: Colors.yellow,
            ),
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
          Text(title)
        ],
      ),
    );
  }
}
