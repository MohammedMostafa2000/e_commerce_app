import 'package:dio/dio.dart';
import 'package:e_commerce_app/auth/data/models/auth_response.dart';
import 'package:e_commerce_app/auth/data/models/user_data_model.dart';
import 'package:injectable/injectable.dart';
@singleton
class ApiServices {
  static Dio dio = Dio();

   Future<AuthResponse> register({
    required String name,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) async {
    final user = UserDataModel(
      name: name,
      email: email,
      password: password,
      rePassword: rePassword,
      mobileNumber: phone,
    );
    try {
      final response =
          await dio.post('https://ecommerce.routemisr.com/api/v1/auth/signup', data: user.toJson());
      return AuthResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        return AuthResponse.fromJson(e.response?.data);
      } else {
        return AuthResponse(message: e.message ?? "Something went wrong");
      }
    }
  }

   Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    final user = UserDataModel(
      email: email,
      password: password,
    );
    try {
      final response =
          await dio.post('https://ecommerce.routemisr.com/api/v1/auth/signin', data: user.toJson());
      return AuthResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        return AuthResponse.fromJson(e.response?.data);
      } else {
        return AuthResponse(message: e.message ?? "Something went wrong");
      }
    }
  }
}
