class SignUp {
  String? firstname;
  String? lastname;
  String? username;
  String? mobileNumber;
  String? email;
  String? password;
  String? confirmedPassword;

  SignUp(
      {this.firstname,
      this.lastname,
      this.username,
      this.mobileNumber,
      this.email,
      this.password,
      this.confirmedPassword});

  SignUp.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    username = json['username'];
    mobileNumber = json['mobileNumber'];
    email = json['email'];
    password = json['password'];
    confirmedPassword = json['confirmedPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['username'] = username;
    data['mobileNumber'] = mobileNumber;
    data['email'] = email;
    data['password'] = password;
    data['confirmedPassword'] = confirmedPassword;
    return data;
  }
}
