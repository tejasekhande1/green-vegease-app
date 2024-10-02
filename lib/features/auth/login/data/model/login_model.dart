// ignore_for_file: public_member_api_docs, sort_constructors_first
class LogInModel {
  bool? success;
  String? token;
  User? user;
  String? message;

  LogInModel({this.success, this.token, this.user, this.message});

  LogInModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['message'] = message;
    return data;
  }

  LogInModel copyWith({
    bool? success,
    String? token,
    User? user,
    String? message,
  }) {
    return LogInModel(
      success: success ?? this.success,
      token: token ?? this.token,
      user: user ?? this.user,
      message: message ?? this.message,
    );
  }
}

class User {
  String? id;
  String? email;
  String? username;
  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? role;
  String? profilePicture;
  String? token;

  User(
      {this.id,
      this.email,
      this.username,
      this.firstName,
      this.lastName,
      this.mobileNumber,
      this.role,
      this.profilePicture,
      this.token});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    mobileNumber = json['mobileNumber'];
    role = json['role'];
    profilePicture = json['profilePicture'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['username'] = username;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['mobileNumber'] = mobileNumber;
    data['role'] = role;
    data['profilePicture'] = profilePicture;
    data['token'] = token;
    return data;
  }
}
