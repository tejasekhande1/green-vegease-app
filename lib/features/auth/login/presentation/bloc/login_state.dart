import 'package:equatable/equatable.dart';

class LogInState extends Equatable {
  @override
  List<Object> get props => [];
}

class LogInLoading extends LogInState {}

class LogInSuccess extends LogInState {}

class LogInFailed extends LogInState {
  String error;
  LogInFailed({required this.error});
}

class LogInInitial extends LogInState {}
