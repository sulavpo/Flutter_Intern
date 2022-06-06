import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:myapp/models/task.dart';

part 'blocs_event.dart';
part 'blocs_state.dart';

class BlocsBloc extends HydratedBloc<BlocsEvent, BlocsState> {
  BlocsBloc() : super(const BlocsState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  // void _onFetchTask(FetchTask event, Emitter<BlocsState> emit) {
  //   final state = this.state;
  //   emit(BlocsState(allTasks: List.from(state.allTasks)));
  // }

  void _onAddTask(AddTask event, Emitter<BlocsState> emit) {
    final state = this.state;
    emit(BlocsState(
      allTasks: List.from(state.allTasks)..add(event.task),
    ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<BlocsState> emit) {
    final state = this.state;
    final task = event.task;
    final int index = state.allTasks.indexOf(task);

    //one dot doenot take return type but two dot takes take return type

    List<Task> allTasks = List.from(state.allTasks)..remove(task);
    task.isDone == false
        ? allTasks.insert(index, task.copyWith(isDone: true))
        : allTasks.insert(index, task.copyWith(isDone: false));

    emit(BlocsState(allTasks: allTasks));
  }

  void _onDeleteTask(DeleteTask event, Emitter<BlocsState> emit) {
    final state = this.state;
    emit(BlocsState(allTasks: List.from(state.allTasks)..remove(event.task)));
  }

  @override
  BlocsState? fromJson(Map<String, dynamic> json) {
    return BlocsState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(BlocsState state) {
    return state.toMap();
  }
}
