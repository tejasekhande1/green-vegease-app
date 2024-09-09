import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/remote_login_api.dart';
import 'login_event.dart';
import 'login_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc() : super(LogInInitial()) {
    on<LogInSubmitted>(_onLogIn);
  }
  void _onLogIn(LogInSubmitted event, Emitter<LogInState> emit) async {
    emit(LogInLoading());

    try {
      // Trigger the API call
      await LoginService(Dio()).logIn(event.model);
      // If no error, emit success state
      emit(LogInSuccess());
    } on DioException catch (e) {
      // Log detailed error information
      if (e.response != null) {
        emit(LogInFailed(error: e.response!.data["message"]));
      } else {
        log('${e.message}');
        emit(LogInFailed(error: "Please check details"));
      }
      // Emit failure state with error message
    } catch (e) {
      // Handle other errors
      emit(LogInFailed(error: e.toString()));
    }
  }
}
