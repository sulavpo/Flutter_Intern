part of 'blocs_bloc.dart';

class BlocsState extends Equatable {
  final List<Task> allTasks;
  const BlocsState(
  {
    this.allTasks = const <Task>[],
  });

  @override
  List<Object> get props => [allTasks];
}
 