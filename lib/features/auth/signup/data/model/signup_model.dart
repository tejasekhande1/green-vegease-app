// ignore_for_file: public_member_api_docs, sort_constructors_first
class SignUpModel {
  bool? success;
  String? message;
  User? user;

  SignUpModel({this.success, this.message, this.user});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }

  SignUpModel copyWith({
    bool? success,
    String? message,
    User? user,
  }) {
    return SignUpModel(
      success: success ?? this.success,
      message: message ?? this.message,
      user: user ?? this.user,
    );
  }
}

class User {
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNumber;
  String? profilePicture;

  User(
      {this.firstName,
      this.lastName,
      this.email,
      this.mobileNumber,
      this.profilePicture});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    profilePicture = json['profile_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['mobile_number'] = mobileNumber;
    data['profile_picture'] = profilePicture;
    return data;
  }
}
