import 'package:equatable/equatable.dart';

class ResetPassState extends Equatable {
  const ResetPassState();
  @override
  List<Object> get props => [];
}

class ResetPassLoading extends ResetPassState {}

class ResetPassSuccess extends ResetPassState {}

class ResetPassFailed extends ResetPassState {
  final String error;
  const ResetPassFailed({required this.error});

  @override
  List<Object> get props => [error];
}

class ResetPassInitial extends ResetPassState {}
