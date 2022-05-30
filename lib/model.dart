import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ModelPart extends StatefulWidget {
  final String title;
  const ModelPart({Key? key, required this.title}) : super(key: key);

  @override
  State<ModelPart> createState() => _ModelPartState();
}

class _ModelPartState extends State<ModelPart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Container(
        color: Colors.green,
        width: 20,
        height: 50,
        child: Center(child: Text(widget.title)),
      ),
    );
  }
}
