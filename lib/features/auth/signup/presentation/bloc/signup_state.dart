import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {
  const SignUpState();
  @override
  List<Object> get props => [];
}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpFailed extends SignUpState {
  final String error;
  const SignUpFailed({required this.error});

  @override
  List<Object> get props => [error];
}

class SignUpInitial extends SignUpState {}
