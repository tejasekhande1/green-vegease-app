class CategoryModel {
  final bool? success;
  final String? message;
  final List<Data>? data;

  CategoryModel({
    this.success,
    this.message,
    this.data,
  });

  CategoryModel copyWith({
    bool? success,
    String? message,
    List<Data>? data,
  }) {
    return CategoryModel(
      success: success ?? this.success,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  CategoryModel.fromJson(Map<String, dynamic> json)
      : success = json['success'] as bool?,
        message = json['message'] as String?,
        data = (json['data'] as List?)
            ?.map((dynamic e) => Data.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList()
      };
}

class Data {
  final String? id;
  final String? categoryName;

  Data({
    this.id,
    this.categoryName,
  });

  Data copyWith({
    String? id,
    String? categoryName,
  }) {
    return Data(
      id: id ?? this.id,
      categoryName: categoryName ?? this.categoryName,
    );
  }

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        categoryName = json['categoryName'] as String?;

  Map<String, dynamic> toJson() => {'id': id, 'categoryName': categoryName};
}
