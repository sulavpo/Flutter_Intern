import 'package:flutter/material.dart';
import 'package:myapp/bloc/bloc_exports.dart';

import '../models/task.dart';




class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
  }) : super(key: key);


 

  @override
  Widget build(BuildContext context) {
     TextEditingController titleController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        const Text('Add Text', style: TextStyle(fontSize: 24)),
        const SizedBox(
          height: 10,
        ),
        TextField(
          autofocus: true,
          controller: titleController,
          decoration: const InputDecoration(
            label: Text('Title'),
            border: OutlineInputBorder(),
          ),
        ),
        Row(mainAxisAlignment: 
        MainAxisAlignment.spaceEvenly,
        children: [TextButton(
            onPressed: (() => Navigator.pop(context)),
             child: const Text('Cancel')),
        ElevatedButton(
            onPressed: (() {
              var task = Task(
                title: titleController.text,
              );
              context.read<BlocsBloc>().add(AddTask(task: task));
              Navigator.pop(context);
            }),
            child: const Text('Add'))],)
        
      ]),
    );
  }
}