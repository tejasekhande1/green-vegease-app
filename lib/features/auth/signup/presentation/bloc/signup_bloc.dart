import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_vegease/features/auth/signup/data/remote_signup_api.dart';
import 'package:green_vegease/features/auth/signup/presentation/bloc/signup_state.dart';
import 'signup_event.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpSubmitted>(_onSignUp);
  }
  void _onSignUp(SignUpSubmitted event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());
 
    try {
      // Trigger the API call
      await AuthService(Dio(
      )).signup(event.model);
      // If no error, emit success state
      emit(SignUpSuccess());
      log("Signup successful");
    } on DioException catch (e) {
      // Log detailed error information
      if (e.response != null) {
        emit(SignUpFailed(error: e.response!.data["message"]));
      } else {
        log('${e.message}');
        emit(SignUpFailed(error: "Please check details"));
      }
      // Emit failure state with error message
    } catch (e) {
      // Handle other errors
      emit(SignUpFailed(error: e.toString()));
    }
  }
}
