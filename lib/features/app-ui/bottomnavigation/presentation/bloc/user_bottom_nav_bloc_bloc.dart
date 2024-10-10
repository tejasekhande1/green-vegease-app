import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_bottom_nav_bloc_event.dart';
part 'user_bottom_nav_bloc_state.dart';

class UserBottomNavBloc
    extends Bloc<UserBottomNavBlocEvent, UserBottomNavBlocState> {
  UserBottomNavBloc() : super(UserBottomNavBlocInitial()) {
    on<ChangeTabEvent>((event, emit) {
      emit(BottomNavIndex(index: event.index));
    });
  }
}
