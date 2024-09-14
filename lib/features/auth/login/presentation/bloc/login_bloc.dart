import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/login_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final LoginRepository _repository;
  LogInBloc({required LoginRepository loginRepository})
      : _repository = loginRepository,
        super(LogInInitial()) {
    on<LogInSubmitted>(_onLogIn);
  }
  void _onLogIn(LogInSubmitted event, Emitter<LogInState> emit) async {
    emit(LogInLoading());

    try {
      // Trigger the API call
      // If no error, emit success state

      final data = await _repository.loginUser(event.loginData);
      if (data.success == false) {
        log("@@@@@@@@@@@@@@@@@@${data.message!}");
        emit(LogInFailed(error: data.message!));
      } else {
        emit(LogInSuccess(response: data));
      }
      // Emit failure state with error message
    } catch (e) {
      // Handle other errors
      emit(LoginException(error: e.toString()));
    }
  }
}
