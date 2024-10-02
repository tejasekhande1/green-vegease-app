import 'package:equatable/equatable.dart';

abstract class UpdateProfileState extends Equatable {
  const UpdateProfileState();

  @override
  List<Object> get props => [];
}

class UpdateProfileInitialState extends UpdateProfileState {}

class UpdateProfileLoadingState extends UpdateProfileState {}

class UpdateProfileSuccessState extends UpdateProfileState {
  final String message;
  const UpdateProfileSuccessState({required this.message});

  @override
  List<Object> get props => [message];
}

class UpdateProfileFailedState extends UpdateProfileState {
  final String error;
  const UpdateProfileFailedState({required this.error});

  @override
  List<Object> get props => [error];
}

class UpdateProfileExceptionState extends UpdateProfileState {
  final String error;
  const UpdateProfileExceptionState({required this.error});

  @override
  List<Object> get props => [error];
}
class ProfileSelect extends  UpdateProfileState {
  final String image;
  const ProfileSelect({required this.image});
  @override
  List<Object> get props => [image];
}
