class ResetPassword {
  String? email;
  String? oldPassword;
  String? newPassword;
  String? confirmedNewPassword;

  ResetPassword(
      {this.email,
      this.oldPassword,
      this.newPassword,
      this.confirmedNewPassword});

  ResetPassword.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    oldPassword = json['oldPassword'];
    newPassword = json['newPassword'];
    confirmedNewPassword = json['confirmedNewPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['oldPassword'] = oldPassword;
    data['newPassword'] = newPassword;
    data['confirmedNewPassword'] = confirmedNewPassword;
    return data;
  }
}
