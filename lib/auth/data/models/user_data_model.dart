class UserDataModel {
  String? name;
  String? mobileNumber;
  String? email;
  String? password;
  String? rePassword;

  UserDataModel({
    this.email,
    this.mobileNumber,
    this.name,
    this.password,
    this.rePassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'rePassword': rePassword,
      'phone': mobileNumber,
    };
  }

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      rePassword: json['rePassword'],
      mobileNumber: json['phone'],
    );
  }
}
