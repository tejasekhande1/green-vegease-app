import 'package:equatable/equatable.dart';
import '../../domain/model/login_model.dart';

abstract class LogInEvent extends Equatable {
  const LogInEvent();

  @override
  List<Object> get props => [];
}

class LogInSubmitted extends LogInEvent {
  final LogIn model;

  const LogInSubmitted({required this.model});

  @override
  List<Object> get props => [model];
}
