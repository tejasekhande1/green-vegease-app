import 'package:equatable/equatable.dart';

abstract class ResetPassEvent extends Equatable {
  const ResetPassEvent();

  @override
  List<Object> get props => [];
}

class ResetPassSubmitted extends ResetPassEvent {
  final Map<String,dynamic> resetData;

  const ResetPassSubmitted({required this.resetData});

  @override
  List<Object> get props => [resetData];
}
