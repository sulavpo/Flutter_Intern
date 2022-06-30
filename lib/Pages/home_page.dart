import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mohar_app/Pages/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = "/Home-Page";
  // var data;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isloaded = false;
  Future<bool> fromData() async {
    var data;
    bool a = false;

    var cat = await FirebaseFirestore.instance
        .collection('users')
        .doc(_auth.currentUser!.uid.toString())
        .get()
        .then((doc) => {data = doc.data()})
        .catchError((error) =>
            {print("Error on get data from User"), print(error.toString())});

    email = data["email"];
    name = data["phone"];
    gender = data["gender"];
    profile = data["pro_image"];
    front = data["font_image"];
    back = data["back_image"];
    document = data["dc_tytpe"];
    uid = data["uid"];
    if (cat != null) {
      a = true;
      return a;
    }
    return a;
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  String? email;
  String? name;
  String? gender;
  String? profile;
  String? front;
  String? back;
  String? document;
  String? uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () async {
                      isloaded = await fromData();
                      setState(() {});

                      // DocumentSnapshot snap = await FirebaseFirestore.instance
                      //     .collection('users')
                      //     .doc(_auth.currentUser!.uid.toString())
                      //     .get();
                      // print(snap.data());
                    },
                    child: const Text('Press Me ')),
                ElevatedButton(
                    onPressed: () {
                      GoogleSignIn().disconnect();
                      FirebaseAuth.instance.signOut().then((value) {
                        Navigator.pushNamed(context, LogIn.routeName);
                      });
                    },
                    child: const Text("Logout")),
                !isloaded
                    ? CircularProgressIndicator()
                    : Column(
                        children: [
                          Text(email ?? 'null cha'),
                          Text(name ?? ''),
                          Text(profile ?? ''),
                          Text(front ?? ''),
                          Text(back ?? ''),
                          Text(uid ?? ''),
                          Image.network(profile ?? '')
                        ],
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
