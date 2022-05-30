import 'package:api_project/dummy_services.dart';
import 'package:api_project/model.dart';
import 'package:flutter/material.dart';
import 'model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DummyModel? model;
  bool isLoaded = false;

  List<DummyModel> dummyList = [
    DummyModel(fact: "hhh", length: 4),
    DummyModel(fact: "hsdfsdhh", length: 4),
  ];

  @override
  void didChangeDependencies() async {
    var data = await DummyServices().getData();
    setState(() {
      model = data;
      dummyList.add(data);
      isLoaded = true;
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(dummyList[index].fact!),
            );
          },
        ),
        // body: isLoaded
        //     ? Column(
        //         children: [
        //           Container(
        //               width: 550,
        //               height: 150,
        //               color: Colors.green,
        //               child: Padding(
        //                 padding: const EdgeInsets.all(10.0),
        //                 child: Text(model!.fact!),
        //               )),
        //           Container(
        //               width: 550,
        //               height: 150,
        //               color: Colors.blue,
        //               child: Padding(
        //                 padding: const EdgeInsets.all(10.0),
        //                 child: Text(model!.length.toString()),
        //               )),
        //         ],
        //       )
        //     : Padding(
        //         padding: const EdgeInsets.all(150.0),
        //         child: Column(
        //           children: const [
        //             CircularProgressIndicator(),
        //             Text('Please wait ....')
        //           ],
        //         ),
        //       )
      ),
    );
  }
}
