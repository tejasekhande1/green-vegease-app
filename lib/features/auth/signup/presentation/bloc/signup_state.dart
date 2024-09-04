import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpFailed extends SignUpState {
  String error;
  SignUpFailed({required this.error});
}

class SignUpInitial extends SignUpState {}
