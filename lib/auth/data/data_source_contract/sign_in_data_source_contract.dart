import 'package:e_commerce_app/auth/data/models/auth_response.dart';

abstract class SignInDataSourceContract {
  Future<AuthResponse> signIn({
    required String email,
    required String password,
  });
}
