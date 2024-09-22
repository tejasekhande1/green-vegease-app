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
        _dio = dio;

  Future<CategoryModel> addCategory(Map<String, dynamic> body) async {
    try {
      debugPrint("In Category Service before headers");

      // Add logging interceptor for debugging API calls
      _dio.interceptors.add(Utils.getLoggingInterceptor());

      // Make the API call using the Category API service
      final data = await _categoryApi.addCategory(body);
      return data;
    } on DioException catch (e) {
      if (e.response != null) {
        return CategoryModel(
            success: false, message: e.response!.data['message']);
      } else {
        throw Exception("Failed to add category: $e");
      }
    } catch (e) {
      throw Exception("Failed to add category: $e");
    }
  }

  // Similarly, you can add methods for fetching, updating, deleting categories.
}
