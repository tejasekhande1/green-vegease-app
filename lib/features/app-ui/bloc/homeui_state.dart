part of 'homeui_bloc.dart';

sealed class HomeuiState extends Equatable {
  const HomeuiState();
  
  @override
  List<Object> get props => [];
}

final class HomeuiInitial extends HomeuiState {}
