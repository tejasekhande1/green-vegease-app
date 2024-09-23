import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/category_repository.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _repository;

  CategoryBloc({required CategoryRepository repository})
      : _repository = repository,
        super(CategoryInitialState()) {
    on<AddCategorySubmittedEvent>(_onAddCategory);
    on<GetCategoryRequestedEvent>(_onGetCategory);
    on<UpdateCategorySubmittedEvent>(_onUpdateCategory);
    on<DeleteCategoryRequestedEvent>(_onDeleteCategory);
  }

  // Handle Add Category
  void _onAddCategory(
      AddCategorySubmittedEvent event, Emitter<CategoryState> emit) async {
    emit(CategoryLoadingState());

    try {
      final response =
          await _repository.addCategory({"categoryName": event.categoryName});

      if (response.success!) {
        emit(
            const CategorySuccessState(message: 'Category added successfully'));
        add(const GetCategoryRequestedEvent());
      } else {
        emit(CategoryFailedState(error: response.message!));
        add(const GetCategoryRequestedEvent());
      }
    } catch (e) {
      log('Category addition failed: $e');
      emit(CategoryExceptionState(error: e.toString()));
    }
  }

  // Handle Get Category by ID
  void _onGetCategory(
      GetCategoryRequestedEvent event, Emitter<CategoryState> emit) async {
    emit(CategoryLoadingState());

    try {
      final response = await _repository.getCategory();

      if (response.success!) {
        emit(CategoryLoadedState(category: response));
      } else {
        emit(CategoryFailedState(error: response.message!));
      }
    } catch (e) {
      log('Category retrieval failed: $e');
      emit(CategoryExceptionState(error: e.toString()));
    }
  }

  // Handle Update Category by ID
  void _onUpdateCategory(
      UpdateCategorySubmittedEvent event, Emitter<CategoryState> emit) async {
    emit(CategoryLoadingState());

    try {
      final response = await _repository.updateCategory(
        event.categoryId,
        {"name": event.updatedCategoryName},
      );

      if (response.success!) {
        emit(CategorySuccessState(message: 'Category updated successfully'));
      } else {
        emit(CategoryFailedState(error: response.message!));
      }
    } catch (e) {
      log('Category update failed: $e');
      emit(CategoryExceptionState(error: e.toString()));
    }
  }

  // Handle Delete Category by ID
  void _onDeleteCategory(
      DeleteCategoryRequestedEvent event, Emitter<CategoryState> emit) async {
    emit(CategoryLoadingState());

    try {
      final response = await _repository.deleteCategory(event.categoryId);

      if (response.success!) {
        emit(CategorySuccessState(message: 'Category deleted successfully'));
      } else {
        emit(CategoryFailedState(error: response.message!));
      }
    } catch (e) {
      log('Category deletion failed: $e');
      emit(CategoryExceptionState(error: e.toString()));
    }
  }
}
