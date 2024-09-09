import 'package:equatable/equatable.dart';
import 'package:green_vegease/features/auth/forgot_password/domain/reset_pass_model.dart';

abstract class ResetPassEvent extends Equatable {
  const ResetPassEvent();

  @override
  List<Object> get props => [];
}

class ResetPassSubmitted extends ResetPassEvent {
  final ResetPassword model;

  const ResetPassSubmitted({required this.model});

  @override
  List<Object> get props => [model];
}
