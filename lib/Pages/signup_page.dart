// import 'dart:ffi';
// import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_part/Pages/form.dart';
import 'package:firebase_part/Pages/landing_screen.dart';
import 'package:firebase_part/Pages/landing_screen2.dart';
import 'package:firebase_part/model/address_model.dart';
import 'package:firebase_part/model/data_model.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  static const routeName = "/Signup-page";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<void> addUser(Data data) {
    return users.add(data.toMap()).then((value) {
      print("User Added");
      // Navigator.pushNamed(context, LandingScreen.routeName);
    }).catchError((error) => print("Failed to add user: $error"));
  }

  DatabaseReference ref = FirebaseDatabase.instance.ref("users/1");
  Future<void> addReal(Data data) async {
    return await ref.set(data.toMap()).then((value) {
      print("User also Added to RealTime Database");
      Navigator.pushNamed(context, LandingScrn.routeName);
    }).catchError((error) => print("Failed to add user: $error"));
  }

  final _formKey = GlobalKey<FormState>();
  bool hidePassword = true;
  bool isLoading = false;
  TextEditingController fullname = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController passw = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController mother = TextEditingController();
  TextEditingController father = TextEditingController();
  TextEditingController age = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.only(top: 28.0),
                child: Text(
                  'SignUp',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
              TextForm().formField(
                  fullname: 'Fullname',
                  icon: const Icon(Icons.account_circle, color: Colors.black),
                  type: fullname),
              TextForm().formField(
                  fullname: 'Address',
                  icon: const Icon(Icons.home, color: Colors.black),
                  type: address),
              TextForm().formField(
                  fullname: 'Phone',
                  icon: const Icon(Icons.phone_android_outlined,
                      color: Colors.black),
                  type: phone),
              TextForm().formField(
                  fullname: 'Mother',
                  icon: const Icon(Icons.account_circle_outlined,
                      color: Colors.black),
                  type: mother),
              TextForm().formField(
                  fullname: 'Father',
                  icon: const Icon(Icons.account_circle_outlined,
                      color: Colors.black),
                  type: father),
              TextForm().formField(
                  fullname: 'Age',
                  icon: const Icon(Icons.accessibility_new_outlined,
                      color: Colors.black),
                  type: age),
              TextForm().passwordField(
                fullname: 'Password',
                icon: const Icon(Icons.key, color: Colors.black),
                type: passw,
                obscure: hidePassword,
                password: IconButton(
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    icon: Icon(hidePassword
                        ? Icons.visibility_off
                        : Icons.visibility)),
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      List<String> fullAddress = address.text.split(',');
                      FullAddress addressModel = FullAddress(
                          city: fullAddress[0],
                          district: fullAddress[1],
                          provision: fullAddress[2]);
                      addUser(Data(fullname.text, addressModel, phone.text,
                          mother.text, father.text, passw.text));
                      addReal(Data(fullname.text, addressModel, phone.text,
                          mother.text, father.text, passw.text));
                    }
                  },
                  child: const Text('Press me Signup'))
            ]),
          ),
        ),
      ),
    );
  }
}
