import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_vegease/features/auth/signup/presentation/bloc/signup_state.dart';
import '../../data/repository/sign_up_repository.dart';
import 'signup_event.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpRepository _repository;
SignUpBloc({required SignUpRepository signUpRepository})
      : _repository = signUpRepository,
        super(SignUpInitial()) {
    on<SignUpSubmitted>(_onSignUp);
  }
  void _onSignUp(SignUpSubmitted event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());

    try {
      // Trigger the API call
      final data = await _repository.signUpUser(event.signUpData);
      if(data.success!){
        emit(SignUpSuccess());
      }else{
        // Emit failure state with error message
         emit(SignUpFailed(error: data.message!));
      }
    
    } catch (e) {
      // Handle other errors
      emit(SignUpFailed(error: e.toString()));
    }
  }
}
