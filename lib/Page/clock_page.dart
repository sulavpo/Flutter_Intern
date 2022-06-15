import 'dart:ui';

import 'package:blco_api/constants/api_endpoints.dart';
import 'package:blco_api/cubit/theme_cubit.dart';
import 'package:blco_api/main.dart';
import 'package:blco_api/model/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class ClockPage extends StatefulWidget {
  const ClockPage({Key? key}) : super(key: key);

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SafeArea(
           child: BlocBuilder<ThemeCubit, bool>(
                builder: (context, state) {
                  return SwitchListTile(
                    value: state,
                    onChanged: (value) {
                      BlocProvider.of<ThemeCubit>(context)
                          .toogleTheme(value: value);
                    },
                    title: const Text('Toggle Theme'),
                  );
                },
              ),
         ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: PageView.builder(
                itemCount: logoPartList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return LogoPart(
                    imageName: logoPartList[index].imageName,
                    title: logoPartList[index].title,
                    color: logoPartList[index].color,
                    onTap: logoPartList[index].onTap,
                  );
                }),
          ),
        ),
        Expanded(
            flex: 1,
            child: SizedBox(
              height: 20,
            ))
      ],
    );
  }
}

void getTime(String path) async {
  //make the request

  final response = await http.get(Uri.parse("${ApiEndpoints.baseUrl}$path"));

  // sample info available in response

  final statusCode = response.statusCode;
  if (statusCode == 200) {
    Map data = jsonDecode(response.body);

    //print(data); //done to check if there is an error

    String datetime = data['datetime'];
    //String offset = data['utc_offset'];
    // done to check if there is an error

    //get properties from data
    //print(datetime);  // done to check the error
    //print(offset);   // done to check the error

    //store the value in date ,time and times

    var date = datetime.split("T").first;
    var times = datetime.split("T").last;

    var time = times.split(".").first;
    //if the case is true print dialouge box

    showDialog(
        context: AppSettings.navigatorKey.currentContext!,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.blueGrey[700],

            content: SizedBox(
              height: 250,
              width: 250,
              child: Stack(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(100,15,20,20),
                  child: Icon(
                    Icons.watch,size: 40,color: Colors.white,
                  ),
                ),
                Padding(
                 padding: const EdgeInsets.fromLTRB(60,75,20,20),
                  child: Text("Time $time",style: TextStyle(color: Colors.white,fontSize: 20),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(100,115,20,20),
                  child: Icon(Icons.calendar_today,color: Colors.white,size: 40,),
                ),
                Padding(
                 padding: const EdgeInsets.fromLTRB(60,165,20,3),
                  child: Text("Date: $date",style: TextStyle(color: Colors.white)),
                ),
                Padding(
                 padding: const EdgeInsets.fromLTRB(90,200,20,3),
                  child: ElevatedButton(
                    child: const Text("OK"),
                    onPressed: () {

                      //Navigator.pushNamed(context, "/screen1");
                      Navigator.pop(context);
                    },
                  ),
                )
              ]),
            ),
           
          );
        });

    //create DateTime object
  } else {
    //if wrong print not working

    print('not working');
  }
}
