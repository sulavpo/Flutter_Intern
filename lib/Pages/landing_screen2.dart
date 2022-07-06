import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_part/Pages/row.dart';
import 'package:firebase_part/Pages/signup_page.dart';
// import 'package:firebase_part/dialouge/dialouge.dart';
import 'package:firebase_part/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// final FirebaseFirestore _db = FirebaseFirestore.instance;

class LandingScrn extends StatefulWidget {
  const LandingScrn({Key? key}) : super(key: key);
  static const routeName = "/Landing-scrn";

  @override
  State<LandingScrn> createState() => _LandingScrnState();
}

class _LandingScrnState extends State<LandingScrn> {
  String? stored;
  bool showData = false;
  bool hasData = false;
  Future<String> getJsonFromFirebaseAPI() async {
    String url =
        "https://test-c87d4-default-rtdb.asia-southeast1.firebasedatabase.app/users.json";
    http.Response response = await http.get(Uri.parse(url));
    return response.body;
  }

  List<Data> charData = [];
  Future loadSaleData() async {
    String jsonString = await getJsonFromFirebaseAPI();
    final jsonResponse = json.decode(jsonString);
    setState(() {
      for (var i in jsonResponse) {
        if (i != null) {
          charData.add(Data.fromJson(i));
        }
      }
    });
  }

  // Future<List<Data>> retrieveUsers() async {
  //   QuerySnapshot<Map<String, dynamic>> snapshot =
  //       await _db.collection("users").get();
  //   // print(snapshot.docs);
  //   return snapshot.docs
  //       .map((docSnapshot) => Data.fromDocumentSnapshot(docSnapshot))
  //       .toList();
  // }

  @override
  void didChangeDependencies() async {
    await loadSaleData();

    setState(() {
      hasData = true;
    });

    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[600],
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 168.0, left: 10, right: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Welcome to landing Page",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignUp.routeName);
                      },
                      child: const Text("Logout")),
                  ElevatedButton(
                      onPressed: () async {
                        charData = [];
                        print(await loadSaleData());
                        setState(() {
                          showData = true;
                        });
                      },
                      child: const Text("Press Me")),
                  Visibility(
                      visible: showData,
                      child: !hasData
                          ? const SizedBox()
                          : SizedBox(
                              height: 200,
                              child: StreamBuilder<Object>(
                                stream: null,
                                builder: (context, snapshot) {
                                  return ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: charData.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CustomRow().customRow(
                                                data: charData[index].fullname,label: 'Name:\t',context: context,type:'name'),
                                            CustomRow().customRow(
                                                data: charData[index].mother,label: 'Mother Name:\t',context: context,type:'mother'),
                                            CustomRow().customRow(
                                                data: charData[index].father,label: 'Father Name:\t',context: context,type:'father'),
                                            CustomRow().customRow(
                                                data: charData[index].password,label: 'Password:\t',context: context,type:'password'),
                                            CustomRow().customRow(
                                                data: charData[index].phone,label: 'Phone:\t',context: context,type:'phone'),
                                            CustomRow().customAddress(
                                                city: charData[index].address.city,context: context,type:'address',
                                                district: charData[index]
                                                    .address
                                                    .district,
                                                provision: charData[index]
                                                    .address
                                                    .provision)
                                          ],
                                        );
                                      });
                                }
                              ),
                            )
                 
                      ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
