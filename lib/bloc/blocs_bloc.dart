
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myapp/models/task.dart';

part 'blocs_event.dart';
part 'blocs_state.dart';

class BlocsBloc extends Bloc<BlocsEvent, BlocsState> {
  BlocsBloc() : super(const BlocsState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }
  void _onAddTask(AddTask event, Emitter<BlocsState> emit) {
    final State = this.state;
    emit(BlocsState(
      allTasks: List.from(state.allTasks)..add(event.task),
    ));
  }
    void _onUpdateTask(UpdateTask event, Emitter<BlocsState> emit) {}
    void _onDeleteTask(DeleteTask event, Emitter<BlocsState> emit) {}
  }
