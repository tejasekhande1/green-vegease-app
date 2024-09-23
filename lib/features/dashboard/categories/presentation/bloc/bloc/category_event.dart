import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object?> get props => [];
}

// Event for adding a category
class AddCategorySubmittedEvent extends CategoryEvent {
  final String categoryName;

  const AddCategorySubmittedEvent({required this.categoryName});

  @override
  List<Object?> get props => [categoryName];
}

// Event for fetching a category by ID
class GetCategoryRequestedEvent extends CategoryEvent {

  const GetCategoryRequestedEvent();

  @override
  List<Object?> get props => [];
}

// Event for updating a category by ID
class UpdateCategorySubmittedEvent extends CategoryEvent {
  final String categoryId;
  final String updatedCategoryName;

  const UpdateCategorySubmittedEvent({
    required this.categoryId,
    required this.updatedCategoryName,
  });

  @override
  List<Object?> get props => [categoryId, updatedCategoryName];
}

// Event for deleting a category by ID
class DeleteCategoryRequestedEvent extends CategoryEvent {
  final String categoryId;

  const DeleteCategoryRequestedEvent({required this.categoryId});

  @override
  List<Object?> get props => [categoryId];
}
