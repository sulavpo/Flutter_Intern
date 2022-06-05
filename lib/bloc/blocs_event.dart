part of 'blocs_bloc.dart';

abstract class BlocsEvent extends Equatable {
  const BlocsEvent();
   @override
  List<Object> get props => [];

}

class AddTask extends BlocsEvent {
  final Task task;
  const AddTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];

}
class UpdateTask extends BlocsEvent {
  final Task task;
  const UpdateTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];

}
class DeleteTask extends BlocsEvent {
  final Task task;
  const DeleteTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];

}