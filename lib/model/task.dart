import 'package:equatable/equatable.dart';

class Report extends Equatable {
  final String id;
  bool? isFetch;
  bool? isReset;

  Report({required this.id,
    this.isFetch,
    this.isReset,
  }) {
    isFetch = isFetch ?? false;
    isReset = isReset ?? false;
  }
  Report copyWith({
    String? id,
    bool? isFetch,
    bool? isReset,
  }) {
    return Report(
      id: id ?? this.id,
      isFetch: isFetch ?? this.isFetch,
      isReset: isReset ?? this.isReset,
    );
  }


  @override
  List<Object?> get props => [
    id,
    isFetch, 
    isReset];
}