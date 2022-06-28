// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dummy_firebase/constants/image.dart';
import 'package:dummy_firebase/pages/google_signin.dart';
import 'package:dummy_firebase/pages/home_page.dart';
import 'package:dummy_firebase/pages/signup_page.dart';
import 'package:dummy_firebase/toasts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

//create ScreenArguments class with constructor

class ScreenArguments {
  final String? id;
  final String? email;
  final String? displayName;

  //constructor

  ScreenArguments({this.id, this.email, this.displayName});
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = "/login-page";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //declearing variables
  bool exist = false;
  // globally
  final _formkey = GlobalKey<FormState>();
  bool hidePassword = true;
  final emailText = TextEditingController();
  final passwordText = TextEditingController();

  Future<void> getData(String email) async {
    QuerySnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      exist = (querySnapshot.docs.any((doc) => email == doc["email"]));
      return querySnapshot;
    });
    //     var data = snap.docs.first.data();
    // print(snap.docs.any((element) => uid == element.));
    // return snap.docs.any((element) => uid == element.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      body: SafeArea(
        child: Form(
          //when we validate or used text form field we use key= golbally decleared key

          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome!!',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: TextFormField(
                    controller: emailText,
                    validator: (input) {
                      if (input == null || input == "") {
                        return 'Email cannot be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusColor: Colors.white,
                        labelText: 'Email',
                        fillColor: Colors.white,
                        suffixIconColor: Colors.white,
                        suffixIcon: const Icon(Icons.mail)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: TextFormField(
                    controller: passwordText,
                    obscureText: hidePassword,
                    validator: (input) => input != null && input.length < 8
                        ? 'Password should be more than 3 '
                        : null,
                    decoration: InputDecoration(
                        filled: true,
                        focusColor: Colors.white,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.black),
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
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (_formkey.currentState!.validate()) {
                          FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: emailText.text,
                                  password: passwordText.text)
                              .then((value) {
                            Navigator.pushNamed(context, Homepage.routeName);
                          }).onError((error, stackTrace) {
                            Toasts.showToast(
                                "Invalid Email/Password", Colors.red);
                          });
                        }
                      });
                    },
                    child: const Text('LogIn')),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text('Or Login\n in With'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () async {
                        //google sign in authentication

                        final user = await GoogleSignIn().signIn();
                        if (user == null) return;
                        GoogleSignInAccount? loggedUser = user;
                        final GoogleSignInAuthentication
                            googleSignInAuthentication =
                            await loggedUser.authentication;
                        print(loggedUser.email);
                        print(loggedUser.displayName);

                        final AuthCredential authCredential =
                            GoogleAuthProvider.credential(
                                accessToken:
                                    googleSignInAuthentication.accessToken,
                                idToken: googleSignInAuthentication.idToken);

                        FirebaseAuth.instance
                            .signInWithCredential(authCredential);

                        // bool exists = await
                        await getData(loggedUser.email);

                        // print(loggedUser.email);
                        // print(loggedUser.displayName);
                        if (exist == false) {
                          Navigator.pushNamed(context, GogSign.routeName,
                              arguments: ScreenArguments(
                                  id: loggedUser.id,
                                  email: loggedUser.email,
                                  displayName: loggedUser.displayName!));
                        } else {
                          Navigator.pushNamed(context, Homepage.routeName);
                        }
                      },
                      child: SvgPicture.asset(
                        AppImages.ggl,
                        height: 50,
                        width: 50,
                      )),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                    onPressed: () {
                      setState(() {
                        Navigator.pushNamed(context, SignUp.routeName,
                            arguments: ScreenArguments());
                      });
                    },
                    child: Text('Create a new account'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
