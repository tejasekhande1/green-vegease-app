import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../api/category_api.dart';
import '../model/category_model.dart'; // Replace with actual model path
import '../../../../../core/utils/utils.dart'; // Replace with actual utilities path

class CategoryService {
  final CategoryApiService _categoryApi;
  final Dio _dio;

  CategoryService({required CategoryApiService categoryApi, required Dio dio})
      : _categoryApi = categoryApi,
        _dio = dio {
    // Add logging interceptor to Dio for debugging purposes
    _dio.interceptors.add(Utils.getLoggingInterceptor());
  }

  // Add Category
  Future<CategoryModel> addCategory(Map<String, dynamic> body) async {
    try {
      debugPrint("In Category Service: Adding Category");
      final data = await _categoryApi.addCategory(body);
      return data;
    } on DioException catch (e) {
      if (e.response != null) {
        return CategoryModel(
          success: false,
          message: e.response!.data['message'],
        );
      } else {
        throw Exception("Failed to add category: ${e.message}");
      }
    } catch (e) {
      throw Exception("Failed to add category: $e");
    }
  }

  // Get Category by ID
  Future<CategoryModel> getCategory() async {
    try {
      debugPrint("In Category Service: Fetching Category with ID ");
      final data = await _categoryApi.getCategory();
      return data;
    } on DioException catch (e) {
      if (e.response != null) {
        return CategoryModel(
          success: false,
          message: e.response!.data['message'],
        );
      } else {
        throw Exception("Failed to fetch category: ${e.message}");
      }
    } catch (e) {
      throw Exception("Failed to fetch category: $e");
    }
  }

  // Update Category by ID
  Future<CategoryModel> updateCategory(
      String id, Map<String, dynamic> body) async {
    try {
      debugPrint("In Category Service: Updating Category with ID $id");
      final data = await _categoryApi.updateCategory(id, body);
      return data;
    } on DioException catch (e) {
      if (e.response != null) {
        return CategoryModel(
          success: false,
          message: e.response!.data['message'],
        );
      } else {
        throw Exception("Failed to update category: ${e.message}");
      }
    } catch (e) {
      throw Exception("Failed to update category: $e");
    }
  }

  // Delete Category by ID
  Future<CategoryModel> deleteCategory(String id) async {
    try {
      debugPrint("In Category Service: Deleting Category with ID $id");
      final data = await _categoryApi.deleteCategory(id);
      return data;
    } on DioException catch (e) {
      if (e.response != null) {
        return CategoryModel(
          success: false,
          message: e.response!.data['message'],
        );
      } else {
        throw Exception("Failed to delete category: ${e.message}");
      }
    } catch (e) {
      throw Exception("Failed to delete category: $e");
    }
  }
}
