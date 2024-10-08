import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'homeui_event.dart';
part 'homeui_state.dart';

class HomeuiBloc extends Bloc<HomeuiEvent, HomeuiState> {
  HomeuiBloc() : super(HomeuiInitial()) {
    on<HomeuiEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
