import 'package:flutter/material.dart';
import 'model.dart';
import 'package:http/http.dart' as http;

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String? stringResponse;

  List<ModelPart> modelPartList = <ModelPart>[
    const ModelPart(title: 'hello'),
    const ModelPart(title: 'hello')
  ];

  @override
  void initState() {
    apicall();
    super.initState();
  }

  Future apicall() async {
    http.Response? response;
    response = await http.get(Uri.parse("https://catfact.ninja/fact"));
    if (response.statusCode == 200) {
      setState(() {
        stringResponse = response!.body;
        modelPartList.add(ModelPart(title: stringResponse!));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: modelPartList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: ModelPart(title: modelPartList[index].title),
            );
          })),
    );
  }
}
