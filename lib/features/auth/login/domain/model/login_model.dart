class LogIn {
  String? mobileNumber;
  String? password;

  LogIn({this.mobileNumber, this.password});

  LogIn.fromJson(Map<String, dynamic> json) {
    mobileNumber = json['mobileNumber'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobileNumber'] = mobileNumber;
    data['password'] = password;
    return data;
  }
}
