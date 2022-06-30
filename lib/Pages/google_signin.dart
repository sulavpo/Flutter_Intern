import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mohar_app/Constants/image.dart';
import 'package:mohar_app/Pages/login_page.dart';
import 'package:mohar_app/Pages/next_page.dart';
import 'package:mohar_app/models/next_page_view.dart';

class GogArguments {
  String? fullname;
  String? email;
  String? phone;
  String? password;

  GogArguments({this.fullname, this.email, this.phone, this.password});
}

class GogSign extends StatefulWidget {
  final ScreenArguments arguments;
  // final String? gmail;
  // final String? displayName;
  const GogSign({Key? key, required this.arguments}) : super(key: key);
  static const routeName = "/google-screen";

  @override
  State<GogSign> createState() => _GogSignState();
}

class _GogSignState extends State<GogSign> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final _frmkey = GlobalKey<FormState>();
  final fullname = TextEditingController();
  final emailText = TextEditingController();
  final passwordText = TextEditingController();
  final confirmPassword = TextEditingController();
  final address = TextEditingController();
  final phone = TextEditingController();
  bool hidePassword = true;
  bool hidePassword1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _frmkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          )),
                      Text(
                        '1/3',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
                  child: SvgPicture.asset(AppImages.register,
                      height: 120, width: 120),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text("Register to Get Cash",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 20, right: 20),
                  child: TextFormField(
                      controller: fullname,
                      validator: (input) {
                        if (input!.isEmpty) {
                          return 'Fullname cannot be empty';
                        } else if (input.isNotEmpty &&
                            RegExp(r'^[a-z A-Z,.\-]+$').hasMatch(input)) {
                          return null;
                        }

                        return 'Enter your full name';
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.blue),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Full name',
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ))),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 20, right: 20),
                  child: TextFormField(
                      controller: phone,
                      validator: (input) {
                        if (input!.isEmpty) {
                          return 'Phone number  cannot be empty';
                        } else if (input.isNotEmpty &&
                            RegExp(r"^[0-9]{10}").hasMatch(input)) {
                          return null;
                        }

                        return 'Enter correct phone number';
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.blue),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Phone number',
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.black,
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: TextFormField(
                    controller: passwordText,
                    obscureText: hidePassword,
                    validator: (input) => input != null && input.length < 8
                        ? 'Password should be more than 8 '
                        : null,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                            icon: Icon(hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility)),
                        labelText: 'Password',
                        prefixIcon: const Icon(
                          Icons.key,
                          color: Colors.black,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: TextFormField(
                    controller: confirmPassword,
                    obscureText: hidePassword1,
                    // ignore: unrelated_type_equality_checks
                    validator: (input) => input != passwordText.text
                        ? 'Password doesnot match'
                        : null,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hidePassword1 = !hidePassword1;
                              });
                            },
                            icon: Icon(hidePassword1
                                ? Icons.visibility_off
                                : Icons.visibility)),
                        labelText: ' Confirm Password',
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.black,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(10)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 87, 151, 203))),
                      onPressed: (() async {
                        if (_frmkey.currentState!.validate()) {
                          // CollectionReference reference =
                          //     FirebaseFirestore.instance.collection("users");
                          // String uid = _auth.currentUser!.uid;
                          // reference.doc(uid).set({
                          //   'uid': uid,
                          //   'fullname': fullname.text,
                          //   'email': widget.arguments.email,
                          //   'phone': phone.text,
                          //   'password': passwordText.text
                          // });

                          Navigator.pushNamed(context, NextPage.routeName,
                              arguments: NextPageViewModel(
                                  signupType: SignupType.google,
                                  gogArguments: GogArguments(
                                      fullname: fullname.text,
                                      email: widget.arguments.email,
                                      phone: phone.text,
                                      password: passwordText.text)));
                        }
                      }),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 110),
                        child: Row(
                          children: [
                            Text(
                              'Next',
                              style: TextStyle(fontSize: 15),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              size: 15,
                            )
                          ],
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 90.0, top: 5, bottom: 5),
                  child: Row(
                    children: [
                      Text(
                        'Joined us before?',
                        style: TextStyle(fontSize: 15),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.pushNamed(context, LogIn.routeName);
                          });
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.blue, fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
