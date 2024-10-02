import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'update_profile_event.dart';
import 'update_profile_state.dart';

class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {

  UpdateProfileBloc():super(UpdateProfileInitialState()) {
    on<ProfileImageSelect>(_onProfileSelect);
    on<ProfileImageClear>(_onImageClearRequest);
  }
  void _onImageClearRequest(
      ProfileImageClear event, Emitter<UpdateProfileState> emit) {
    emit(UpdateProfileInitialState());
  }

  void _onProfileSelect(
      ProfileImageSelect event, Emitter<UpdateProfileState> emit) {
    log("InBlocProfile");
    emit(ProfileSelect(image: event.image));
  }


}
