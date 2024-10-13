
import 'package:equatable/equatable.dart';

abstract class UpdateProfileEvent extends Equatable {
  const UpdateProfileEvent();

  @override
  List<Object> get props => [];
}

class UpdateProfileRequestEvent extends UpdateProfileEvent {
  final String name;
  final String email;
  final String gender;
  final String? image;

  const UpdateProfileRequestEvent({required this.name,required this.email,required this.gender,this.image});

  @override
  List<Object> get props => [name,email,gender];
}
class FetchProfileEvent extends UpdateProfileEvent {}
class ProfileImageSelect extends UpdateProfileEvent {
  final String image;
  const ProfileImageSelect({required this.image});
}
class ProfileImageClear extends UpdateProfileEvent {}
