import 'package:flutter/widgets.dart';
import '../model/category_model.dart'; // Replace with actual model path
import '../service/category_service.dart'; // Replace with actual CategoryApiService path

class CategoryRepository {
  final CategoryService _service;

  CategoryRepository({required CategoryService categoryService})
      : _service = categoryService;

  // Add Category
  Future<CategoryModel> addCategory(Map<String, dynamic> body) async {
    try {
      debugPrint("In Category Repository: Adding Category");
      return await _service.addCategory(body);
    } catch (e) {
      throw Exception("Failed to add category: $e");
    }
  }

  // Get Category
  Future<CategoryModel> getCategory() async {
    try {
      debugPrint("In Category Repository: Fetching Category");
      return await _service.getCategory();
    } catch (e) {
      throw Exception("Failed to fetch category: $e");
    }
  }

  // Update Category
  Future<CategoryModel> updateCategory(
      String id, Map<String, dynamic> body) async {
    try {
      debugPrint("In Category Repository: Updating Category");
      return await _service.updateCategory(id, body);
    } catch (e) {
      throw Exception("Failed to update category: $e");
    }
  }

  // Delete Category
  Future<CategoryModel> deleteCategory(String id) async {
    try {
      debugPrint("In Category Repository: Deleting Category");
      return await _service.deleteCategory(id);
    } catch (e) {
      throw Exception("Failed to delete category: $e");
    }
  }
}
