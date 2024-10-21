class LogInModel {
  final bool? success;
  final String? message;
  final Data? data;

  LogInModel({
    this.success,
    this.message,
    this.data,
  });

  LogInModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) {
    return LogInModel(
      success: success ?? this.success,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  LogInModel.fromJson(Map<String, dynamic> json)
    : success = json['success'] as bool?,
      message = json['message'] as String?,
      data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'success' : success,
    'message' : message,
    'data' : data?.toJson()
  };
}

class Data {
  final String? token;
  final User? user;

  Data({
    this.token,
    this.user,
  });

  Data copyWith({
    String? token,
    User? user,
  }) {
    return Data(
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }

  Data.fromJson(Map<String, dynamic> json)
    : token = json['token'] as String?,
      user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'token' : token,
    'user' : user?.toJson()
  };
}

class User {
  final String? id;
  final String? email;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? mobileNumber;
  final String? role;
  final String? profilePicture;

  User({
    this.id,
    this.email,
    this.username,
    this.firstName,
    this.lastName,
    this.mobileNumber,
    this.role,
    this.profilePicture,
  });

  User copyWith({
    String? id,
    String? email,
    String? username,
    String? firstName,
    String? lastName,
    String? mobileNumber,
    String? role,
    String? profilePicture,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      role: role ?? this.role,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }

  User.fromJson(Map<String, dynamic> json)
    : id = json['id'] as String?,
      email = json['email'] as String?,
      username = json['username'] as String?,
      firstName = json['firstName'] as String?,
      lastName = json['lastName'] as String?,
      mobileNumber = json['mobileNumber'] as String?,
      role = json['role'] as String?,
      profilePicture = json['profilePicture'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'email' : email,
    'username' : username,
    'firstName' : firstName,
    'lastName' : lastName,
    'mobileNumber' : mobileNumber,
    'role' : role,
    'profilePicture' : profilePicture
  };
}