import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/category_repository.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _repository; // Replace with actual repository

  CategoryBloc({required CategoryRepository repository})
      : _repository = repository,
        super(CategoryInitialState()) {
    on<AddCategorySubmittedEvent>(_onAddCategory);
  }

  void _onAddCategory(
      AddCategorySubmittedEvent event, Emitter<CategoryState> emit) async {
    emit(CategoryLoadingState());

    try {
      // Call repository to add category
      final response = await _repository.addCategory({"":event.categoryName});

      if (response.success!) {
        emit(CategorySuccessState(message: 'Category added successfully'));
      } else {
        emit(CategoryFailedState(error: response.message!));
      }
    } catch (e) {
      log('Category addition failed: $e');
      emit(CategoryExceptionState(error: e.toString()));
    }
  }
}
