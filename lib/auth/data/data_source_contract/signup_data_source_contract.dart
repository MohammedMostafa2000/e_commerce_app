import 'package:e_commerce_app/auth/data/models/auth_response.dart';

abstract class SignUpDataSourceContract {
  Future<AuthResponse> signUp({
    required String name,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  });
}
