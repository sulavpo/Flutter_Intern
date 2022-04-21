import 'package:flutter/material.dart';
import 'package:test1/simple.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'simple',
    routes: {'simple': (context)=>simple()},
  ));//material app
}
