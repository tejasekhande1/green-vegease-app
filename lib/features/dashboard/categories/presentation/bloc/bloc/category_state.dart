import 'package:equatable/equatable.dart';
import '../../../data/model/category_model.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object?> get props => [];
}

// Initial state when nothing is happening
class CategoryInitialState extends CategoryState {}

// State for when a category-related operation is in progress
class CategoryLoadingState extends CategoryState {}

// State for when a category is successfully loaded
class CategoryLoadedState extends CategoryState {
  final CategoryModel category;

  const CategoryLoadedState({required this.category});

  @override
  List<Object?> get props => [category];
}

// State for when a category-related operation succeeds
class CategorySuccessState extends CategoryState {
  final String message;

  const CategorySuccessState({required this.message});

  @override
  List<Object?> get props => [message];
}

// State for when a category-related operation fails
class CategoryFailedState extends CategoryState {
  final String error;

  const CategoryFailedState({required this.error});

  @override
  List<Object?> get props => [error];
}

// State for when an exception occurs during a category-related operation
class CategoryExceptionState extends CategoryState {
  final String error;

  const CategoryExceptionState({required this.error});

  @override
  List<Object?> get props => [error];
}
