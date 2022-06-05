import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/bloc/bloc_exports.dart';
import 'package:myapp/models/task.dart';

import '../widgets/task_list.dart';
import 'add_task_screen.dart';

class TaskScreen extends StatefulWidget {
  TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
 

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocsBloc, BlocsState>(
      builder: (context, state) {
        List<Task> taskList = state.allTasks;
        return Scaffold(
          backgroundColor: Colors.grey[200],
          extendBody: true,
          appBar: AppBar(title: const Text('To Do List'), actions: [
            IconButton(
              onPressed: (() => _addTask(context)),
              icon: const Icon(Icons.add),
            )
          ]),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Chip(
                  label: Text('Tasks:'),
                  backgroundColor: Colors.white,
                ),
              ),
              TaskList(taskList: taskList)
            ],
          ),
          floatingActionButton: Container(
            margin: const EdgeInsets.only(bottom: 85),
            child: FloatingActionButton(
              onPressed: () => _addTask(context),
              tooltip: 'Add Task',
              child: const Icon(Icons.add),
            ),
          ),
        );
      },
    );
  }
}

