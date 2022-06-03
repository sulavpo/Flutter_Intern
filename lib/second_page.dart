import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:myapp/constants/api_endpoints.dart';
import 'package:myapp/main.dart';
import 'dart:convert';
import 'list_builder.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);
  static const String routeName = "/second-page";

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // getTime();
  }

  _showDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Error:User credentials wrong",
              style: TextStyle(color: Colors.red, fontSize: 18),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text("OK"),
                onPressed: () {
                  //Navigator.pushNamed(context, "/screen1");
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: logoPartList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: LogoPart(
              imageName: logoPartList[index].imageName,
              title: logoPartList[index].title,
              color: logoPartList[index].color,
              onTap: logoPartList[index].onTap,
            ),
          );
        });
  }
}

void getTime(String path) async {
  //make the request
  final response = await http.get(Uri.parse("${ApiEndpoints.baseUrl}$path"));

  // sample info available in response
  final statusCode = response.statusCode;
  if (statusCode == 200) {
    Map data = jsonDecode(response.body);
    //print(data);
    String datetime = data['datetime'];
    //String offset = data['utc_offset'];

    //get properties from data
    //print(datetime);
    //print(offset);
    var date = datetime.split("T").first;
    var times = datetime.split("T").last;

    var time = times.split(".").first;

    showDialog(
        context: AppSettings.navigatorKey.currentContext!,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Time: $time"),
                Text("Date: $date"),
                ElevatedButton(
                  child: const Text("OK"),
                  onPressed: () {
                    //Navigator.pushNamed(context, "/screen1");
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          );
        });

    //create DateTime object
  } else {
    print('not working');
  }
}
