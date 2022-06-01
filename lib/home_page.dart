import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/apiservice.dart';
import 'package:myapp/landing_screen.dart';

String? finalToken;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = "/home-page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool hidePassword = true;
  final emailText = TextEditingController();
  final passwordText = TextEditingController();
  String? token;

  //Mark:API Call
  callLoginApi() {
    final service = ApiService();
    service.apiCallLogin({
      "email": emailText.text,
      "password": passwordText.text,
    }, context).then((value) {
      if (value?.error != null) {
        print("get data >>>>>" + value!.error.toString());
      } else {
        print(value?.token);
      }
    });
  }

  
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(top: 120),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Icon(
                Icons.account_box,
                size: 50,
              ),
              Text('Welcome Back', style: GoogleFonts.bebasNeue(fontSize: 50)),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "You've been Missed",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextFormField(
                        controller: emailText,
                        validator: (input) {
                          if (input == "" || input == null) {
                            return 'Email name cannot be empty';
                          }
                          return null;
                        },
                        decoration: (const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.email))),
                      ),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextFormField(
                        controller: passwordText,
                        obscureText: hidePassword,
                        validator: (input) => input != null && input.length < 3
                            ? 'Password should be more than 3 '
                            : null,
                        decoration: (InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              color: Colors.black.withOpacity(0.2),
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              icon: Icon(hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            hintText: 'Password',
                            prefixIcon: const Icon(Icons.key))),
                      ),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        callLoginApi();
                      }
                    },
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(color: Colors.purple),
                          borderRadius: BorderRadius.circular(12)),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
