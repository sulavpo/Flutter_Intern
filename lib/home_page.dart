import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/apiservice.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final emailText = TextEditingController();
  final passwordText = TextEditingController();

  //Mark:API Call
  callLoginApi() {
    final service = ApiService();

    service.apiCallLogin(
      {
        "email": emailText.text,
        "password": passwordText.text,
      },
    ).then((value) {
      if (value.error != null) {
        print("get data >>>>>" + value.error!);
      } else {
        print(value.token);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(top: 30),
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
                  child:  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: emailText,
                      decoration: (const InputDecoration(
                          border: InputBorder.none, hintText: 'Email')),
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
                  child:  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: passwordText,
                      obscureText: true,
                      decoration: (const InputDecoration(
                          border: InputBorder.none, hintText: 'Password')),
                    ),
                  ),
                )),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: InkWell(
                  onTap: () {
                    callLoginApi();
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
      )),
    );
  }
}
