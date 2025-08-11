import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/mainLayout/data/models/category_response.dart';
import 'package:e_commerce_app/mainLayout/data/models/product_details_response.dart';
import 'package:e_commerce_app/mainLayout/data/models/products_response.dart';

final dio = Dio();

class ApiServices {
  static Future<CategoryResponse> getCategories() async {
    try {
      final response = await dio.get('https://ecommerce.routemisr.com/api/v1/categories');
      return CategoryResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw (e.toString());
    }
  }

  static Future<CategoryResponse> getSubCategoriesBasedOnCategory(
      {required String categoryId}) async {
    try {
      final response = await dio
          .get('https://ecommerce.routemisr.com/api/v1/categories/$categoryId/subcategories');
      return CategoryResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw (e.toString());
    }
  }

  static Future<ProductsResponse> getProductsBasedOnCategory({required String categoryId}) async {
    try {
      final response =
          await dio.get('https://ecommerce.routemisr.com/api/v1/products?category[in]=$categoryId');
      return ProductsResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        log(e.response!.data.toString());
        return ProductsResponse.fromJson(e.response!.data);
      } else {
        return ProductsResponse(
          statusMsg: 'error',
          message: 'Network error or unknown issue.',
        );
      }
    }
  }

  static Future<ProductDetailsResponse> getSpecificProductDetails(
      {required String productID}) async {
    try {
      final response = await dio.get('https://ecommerce.routemisr.com/api/v1/products/$productID');
      return ProductDetailsResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        log(e.response!.data.toString());
        return ProductDetailsResponse.fromJson(e.response!.data);
      } else {
        return ProductDetailsResponse(
          error: 'error',
          message: 'Network error or unknown issue.',
        );
      }
    }
  }
}
