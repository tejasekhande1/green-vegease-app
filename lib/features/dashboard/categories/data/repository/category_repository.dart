import 'package:flutter/widgets.dart';
import '../model/category_model.dart'; // Replace with actual model path
import '../service/category_service.dart';

class CategoryRepository {
  final CategoryService _service;

  CategoryRepository({required CategoryService categoryService})
      : _service = categoryService;

  Future<CategoryModel> addCategory(Map<String, dynamic> body) async {
    try {
      debugPrint("In Category Repository");
      return await _service.addCategory(body);
    } catch (e) {
      throw Exception("Failed to add category: $e");
    }
  }

  // You can add more methods here for fetching, deleting, updating categories, etc.
}
