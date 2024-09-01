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
    Response res = await ApiService(Dio()).SignUp(
        event.model.firstname!,
        event.model.lastname!,
        event.model.email!,
        event.model.email!,
        event.model.username!,
        event.model.password!,
        event.model.confirmedPassword!);
    log("Response:$res");
  }
}
