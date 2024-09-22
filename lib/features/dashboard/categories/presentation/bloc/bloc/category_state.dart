import 'package:equatable/equatable.dart';

class CategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryInitialState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategorySuccessState extends CategoryState {
  final String message;

  CategorySuccessState({required this.message});

  @override
  List<Object?> get props => [message];
}

class CategoryFailedState extends CategoryState {
  final String error;

  CategoryFailedState({required this.error});

  @override
  List<Object?> get props => [error];
}

class CategoryExceptionState extends CategoryState {
  final String error;

  CategoryExceptionState({required this.error});

  @override
  List<Object?> get props => [error];
}
