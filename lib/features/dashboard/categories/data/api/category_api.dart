import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/config/config.dart'; // Replace with your actual AppConfig path
import '../model/category_model.dart'; // Replace with actual model path
part 'category_api.g.dart';

@RestApi(baseUrl: AppConfig.apiBaseUrl)
abstract class CategoryApiService {
  factory CategoryApiService(Dio dio, {String baseUrl}) = _CategoryApiService;

  // Add Category
  @POST(AppConfig.category)
  Future<CategoryModel> addCategory(@Body() Map<String, dynamic> categoryData);

  // Get a Category
  @GET(AppConfig.category)
  Future<CategoryModel> getCategory();

  // Update Category
  @PUT("${AppConfig.category}/{id}")
  Future<CategoryModel> updateCategory(
      @Path("id") String id, @Body() Map<String, dynamic> categoryData);

  // Delete Category
  @DELETE("${AppConfig.category}/{id}")
  Future<CategoryModel> deleteCategory(@Path("id") String id);
}
