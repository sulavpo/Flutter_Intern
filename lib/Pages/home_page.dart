// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_part/model/data_model.dart';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = "/Home-page";

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 150, left: 58, right: 58),
          child: Column(children: [
            Text(
              'Login',
              style: TextStyle(
                  color: Colors.blueGrey[800],
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextFormField(
                textCapitalization: TextCapitalization.words,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Email',
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(
                          10,
                        )),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.black,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextFormField(
                textCapitalization: TextCapitalization.words,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Password',
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(
                          10,
                        )),
                    prefixIcon: const Icon(
                      Icons.key,
                      color: Colors.black,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('Press Me Login')),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(9.7),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red)),
                onPressed: () {
                  setState(() async{
                          });
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Signin Using Google'),
                      Icon(
                        Icons.mail,
                        color: Colors.yellow,
                        size: 30,
                      )
                    ])),
            ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(9.7),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green)),
                onPressed: () {},
                child: const Text('Signup'))
          ]),
        ),
      ),
    );
  }
}
