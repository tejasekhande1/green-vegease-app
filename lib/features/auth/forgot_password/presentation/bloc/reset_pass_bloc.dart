import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_vegease/features/auth/forgot_password/presentation/bloc/reset_pass_state.dart';
import '../../data/remote_reset_pass_api.dart';
import 'reset_pass_event.dart';

class ResetPassBloc extends Bloc<ResetPassEvent, ResetPassState> {
  ResetPassBloc() : super(ResetPassInitial()) {
    on<ResetPassSubmitted>(_onResetPass);
  }
  void _onResetPass(ResetPassSubmitted event, Emitter<ResetPassState> emit) async {
    emit(ResetPassLoading());

    try {
      // Trigger the API call
      await ResetPassService(Dio()).resetPassword(event.model);
      // If no error, emit success state
      emit(ResetPassSuccess());
    } on DioException catch (e) {
      // Log detailed error information
      if (e.response != null) {
        emit(ResetPassFailed(error: e.response!.data["message"]));
      } else {
        log('${e.message}');
        emit(ResetPassFailed(error: "Please check details"));
      }
      // Emit failure state with error message
    } catch (e) {
      // Handle other errors
      emit(ResetPassFailed(error: e.toString()));
    }
  }
}
