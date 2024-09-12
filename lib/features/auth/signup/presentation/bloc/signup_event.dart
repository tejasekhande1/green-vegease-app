import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpSubmitted extends SignUpEvent {
  final Map<String,dynamic> signUpData;

  const SignUpSubmitted({required this.signUpData});

  @override
  List<Object> get props => [signUpData];
}
