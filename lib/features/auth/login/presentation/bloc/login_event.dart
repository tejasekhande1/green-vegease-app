import 'package:equatable/equatable.dart';

abstract class LogInEvent extends Equatable {
  const LogInEvent();

  @override
  List<Object> get props => [];
}

class LogInSubmitted extends LogInEvent {
  final Map<String ,dynamic> loginData;

  const LogInSubmitted({required this.loginData});

  @override
  List<Object> get props => [loginData];
}
