import 'package:equatable/equatable.dart';
import 'package:green_vegease/features/auth/signup/domain/models/signup_model.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpSubmitted extends SignUpEvent {
  final SignUp model;

  const SignUpSubmitted({required this.model});

  @override
  List<Object> get props => [model];
}
