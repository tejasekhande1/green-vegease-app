import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/config/config.dart';
import '../model/category_model.dart'; // Replace with actual model path
part 'category_api.g.dart';

@RestApi(baseUrl: AppConfig.apiBaseUrl)
abstract class CategoryApiService {
  factory CategoryApiService(Dio dio, {String baseUrl}) = _CategoryApiService;

  @POST("/category")
  Future<CategoryModel> addCategory(@Body() Map<String, dynamic> categoryData);

  // Add more endpoints as needed for category (update, delete, get categories, etc.)
}
