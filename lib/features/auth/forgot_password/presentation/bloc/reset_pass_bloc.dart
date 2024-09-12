import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_vegease/features/auth/forgot_password/data/repository/forgot_pass_word_repository.dart';
import 'package:green_vegease/features/auth/forgot_password/presentation/bloc/reset_pass_state.dart';
import 'reset_pass_event.dart';

class ResetPassBloc extends Bloc<ResetPassEvent, ResetPassState> {
  final ForgotPassWordRepository _repository;
  ResetPassBloc({required ForgotPassWordRepository forgotPassWordRepository}) : _repository=forgotPassWordRepository,super(ResetPassInitial()) {
    on<ResetPassSubmitted>(_onResetPass);
  }
  void _onResetPass(
      ResetPassSubmitted event, Emitter<ResetPassState> emit) async {
    emit(ResetPassLoading());

    try {
      // Trigger the API call
      // If no error, emit success state
      final data = await _repository.forgotPass(event.resetData);
      if (data.success!) {
        emit(ResetPassSuccess());
      } else {
        // Emit failure state with error message
        emit(ResetPassFailed(error: data.message!));
      }

      // Emit failure state with error message
    } catch (e) {
      // Handle other errors
      emit(ResetPassFailed(error: e.toString()));
    }
  }
}
