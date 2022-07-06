import 'package:flutter/material.dart';

class ShowBox {
  Widget showbox() {
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: const SizedBox(width: 150, height: 150, child: Text('It worked')),
          actions: [
            ElevatedButton(
                onPressed: (() {
                  Navigator.pop(context);
                }),
                child: const Text("ok"))
          ],
        );
      },
    );
  }
}
