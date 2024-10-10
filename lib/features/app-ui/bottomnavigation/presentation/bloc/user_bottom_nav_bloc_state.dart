part of 'user_bottom_nav_bloc_bloc.dart';

abstract class UserBottomNavBlocState {}

final class UserBottomNavBlocInitial extends UserBottomNavBlocState {}

class BottomNavIndex extends UserBottomNavBlocState {
  int index;
  BottomNavIndex({required this.index});
}
