// ignore_for_file: public_member_api_docs, sort_constructors_first
class ForgotPassWordModel {
  bool? success;
  String? message;

  ForgotPassWordModel({this.success, this.message});

  ForgotPassWordModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    return data;
  }

  ForgotPassWordModel copyWith({
    bool? success,
    String? message,
  }) {
    return ForgotPassWordModel(
      success: success ?? this.success,
      message: message ?? this.message,
    );
  }
}
