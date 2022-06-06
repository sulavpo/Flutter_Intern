import 'package:flutter/material.dart';
import 'package:myapp/bloc/bloc_exports.dart';
import 'package:myapp/models/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          // shrinkWrap: true,
          itemCount: taskList.length,
          itemBuilder: ((context, index) {
            var task = taskList[index];
            return ListTile(
              title: Text(task.title),
              trailing: const Icon(Icons.delete),
              onLongPress: () =>
                  context.read<BlocsBloc>().add(DeleteTask(task: task)),
              leading: Checkbox(
                value: task.isDone,
                onChanged: (value) {
                  context.read<BlocsBloc>().add(UpdateTask(task: task));
                },
              ),
            );
          })),
    );
  }
}
