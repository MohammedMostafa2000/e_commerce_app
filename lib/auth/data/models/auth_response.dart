class AuthResponse {
  String? statusMsg;
  String? message;
  String? token;

  AuthResponse({
    this.message,
    this.statusMsg,
    this.token,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      message: json['errors']?['msg'] ?? json['message'],
      token: json['token'] ?? '',
      statusMsg: json['statusMsg'] ?? '',
    );
  }
}
