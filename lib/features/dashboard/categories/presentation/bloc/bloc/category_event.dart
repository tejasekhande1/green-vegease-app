import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object?> get props => [];
}

class AddCategorySubmittedEvent extends CategoryEvent {
  final String categoryName;

  const AddCategorySubmittedEvent({required this.categoryName});

  @override
  List<Object?> get props => [categoryName];
}
