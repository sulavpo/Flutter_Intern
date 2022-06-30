import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mohar_app/Constants/image.dart';
import 'package:mohar_app/Pages/google_signin.dart';
import 'package:mohar_app/Pages/home_page.dart';
import 'package:mohar_app/Pages/signup_page.dart';
import 'package:mohar_app/toast.dart';

class ScreenArguments {
  final String? id;
  final String? email;
  final String? displayName;

  ScreenArguments(this.id, this.email, this.displayName);
}

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);
  static const routeName = "/login-screen";

  @override
  State<LogIn> createState() => _LogInState();
}

class ImageModel {
  bool isFront;
  String imagUrl;
  ImageModel({required this.imagUrl, required this.isFront});
}

class _LogInState extends State<LogIn> {
// bool exist = false;
  final _formkey = GlobalKey<FormState>();
  bool hidePassword = true;
  final emailText = TextEditingController();
  final passwordText = TextEditingController();

  Future<bool> getData(String mail) async {
    QuerySnapshot snap =
        await FirebaseFirestore.instance.collection('users').get();

    return snap.docs.any((doc) => mail == doc["email"]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 150, 0),
                child: Text('Welcome Back!',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),

              SvgPicture.asset(
                AppImages.rupee,
                height: 170,
                width: 170,
              ),
              const Text(
                'With Foher Get Moher',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              // Svg.asset(AppImages.profile),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextFormField(
                  controller: emailText,
                  validator: (input) {
                    if (input == "" || input == null) {
                      return 'Email name cannot be empty';
                    }
                    return null;
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
                      labelText: 'Email',
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Colors.black,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextFormField(
                  controller: passwordText,
                  obscureText: hidePassword,
                  validator: (input) => input != null && input.length < 8
                      ? 'Password should be more than 3 '
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
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10, left: 200),
                child: Text(
                  'Forget Password?',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: ElevatedButton(
                    style: ButtonStyle(
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(10)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 87, 151, 203))),
                    onPressed: (() {
                      if (_formkey.currentState!.validate()) {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: emailText.text,
                                password: passwordText.text)
                            .then((value) {
                          Navigator.pushNamed(context, HomePage.routeName);
                        }).onError((error, stackTrace) {
                          Toasts.showToast(
                              "Invalid Email/Password", Colors.red);
                        });
                      }
                    }),
                    child: const Center(
                        child: Text(
                      'Login',
                      style: TextStyle(fontSize: 15),
                    ))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  'or',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text('Login with', style: TextStyle(fontSize: 12)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      AppImages.fb,
                      height: 30,
                      width: 30,
                    ),
                    InkWell(
                      onTap: () async {
                        final user = await GoogleSignIn().signIn();
                        if (user == null) return;
                        GoogleSignInAccount? loggedUser = user;
                        final GoogleSignInAuthentication
                            googleSignInAuthentication =
                            await loggedUser.authentication;

                        final AuthCredential authCredential =
                            GoogleAuthProvider.credential(
                                accessToken:
                                    googleSignInAuthentication.accessToken,
                                idToken: googleSignInAuthentication.idToken);

                        FirebaseAuth.instance
                            .signInWithCredential(authCredential);
                        bool exists = await getData(loggedUser.email);

                        // print(loggedUser.email);
                        // print(loggedUser.displayName);
                        if (!exists) {
                          Navigator.pushNamed(context, GogSign.routeName,
                              arguments: ScreenArguments(loggedUser.id,
                                  loggedUser.email, loggedUser.displayName!));
                        } else {
                          Navigator.pushNamed(context, HomePage.routeName);
                        }
                      },
                      child: SvgPicture.asset(
                        AppImages.googl,
                        height: 30,
                        width: 30,
                      ),
                    ),
                    SvgPicture.asset(
                      AppImages.insta,
                      height: 30,
                      width: 30,
                    ),
                    SvgPicture.asset(
                      AppImages.twr,
                      height: 30,
                      width: 30,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                child: ElevatedButton(
                    style: ButtonStyle(
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(10)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green[500])),
                    onPressed: (() {
                      setState(() {
                        Navigator.pushNamed(context, SignUp.routeName,
                            arguments: ScreenArguments("", "", ""));
                      });
                    }),
                    child: const Center(
                        child: Text(
                      'Create a Account',
                      style: TextStyle(fontSize: 15),
                    ))),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
