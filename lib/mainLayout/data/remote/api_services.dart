import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/mainLayout/data/models/category_response.dart';

final dio = Dio();

class ApiServices {
  static Future<CategoryResponse> getCategories() async {
    try {
      final response = await dio.get('https://ecommerce.routemisr.com/api/v1/categories');
      log(response.data.toString());
      return CategoryResponse.fromJson(response.data);
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
