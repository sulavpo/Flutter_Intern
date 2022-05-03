import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                    //color: Colors.red
                    ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "\nHi\nMorning'n Cameron!",
                    style: TextStyle(fontSize: 23, color: Colors.white),
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                    ),
                    child: Image(
                      fit: BoxFit.fill,
                      image: AssetImage('asset/img/avatar.png'),
                    ),
                  ),
                ),
              ))
        ],
      ),
      decoration: BoxDecoration(
          //color: Colors.white
          ),
    );
  }
}
