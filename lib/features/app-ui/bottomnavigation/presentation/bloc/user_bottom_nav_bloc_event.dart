part of 'user_bottom_nav_bloc_bloc.dart';

abstract class UserBottomNavBlocEvent {}

class ChangeTabEvent extends UserBottomNavBlocEvent {
  int index;

  ChangeTabEvent({required this.index});
}
