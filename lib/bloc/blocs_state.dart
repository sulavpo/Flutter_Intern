part of 'blocs_bloc.dart';

class BlocsState extends Equatable {
  final List<Task> allTasks;
  const BlocsState({
    this.allTasks = const <Task>[],
  });

  @override
  List<Object> get props => [allTasks];

  Map<String, dynamic> toMap() {
    return {
      'allTasks': allTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory BlocsState.fromMap(Map<String, dynamic> map){
    return BlocsState(
      allTasks: List<Task>.from(map['allTask']?.map((x) => Task.fromMap(x)))
    );
  }
}
