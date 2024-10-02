import 'package:equatable/equatable.dart';
import 'package:green_vegease/features/auth/login/data/model/login_model.dart';

class LogInState extends Equatable {
  @override
  List<Object> get props => [];
}

class LogInLoading extends LogInState {}

class LogInSuccess extends LogInState {
  final LogInModel response;
  LogInSuccess({required this.response});
}

class LogInFailed extends LogInState {
  final String error;
  LogInFailed({required this.error});
}

class LogInInitial extends LogInState {}

class LoginException extends LogInState {
  final String error;
  LoginException({required this.error});
}
