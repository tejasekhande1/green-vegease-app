import 'package:equatable/equatable.dart';

class ResetPassState extends Equatable {
  @override
  List<Object> get props => [];
}

class ResetPassLoading extends ResetPassState {}

class ResetPassSuccess extends ResetPassState {}

class ResetPassFailed extends ResetPassState {
  String error;
  ResetPassFailed({required this.error});
}

class ResetPassInitial extends ResetPassState {}
