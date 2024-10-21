import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/services/firebase_service/shared_preferences_service/share_prefrences_service.dart';
import '../../../../init_dependancies.dart';
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
        emit(LogInFailed(error: data.message!));
      } else {
        log("In Else");
        await serviceLocator<SharedPreferencesService>()
            .saveToken(data.data!.token!);
        await serviceLocator<SharedPreferencesService>().saveLoginStatus(true);
        emit(LogInSuccess(response: data));
      }
      // Emit failure state with error message
    } catch (e) {
      log("@@@@@@@@@@@@@@@@@@$e");
      emit(LoginException(error: e.toString()));
    }
  }
}
