import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/mainLayout/data/models/cart_response.dart';
import 'package:e_commerce_app/mainLayout/data/models/category_response.dart';
import 'package:e_commerce_app/mainLayout/data/models/product_details_response.dart';
import 'package:e_commerce_app/mainLayout/data/models/products_response.dart';
import 'package:e_commerce_app/mainLayout/data/models/wishlist_response.dart';

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

  static Future<CartResponse> getCartDetails({required String token}) async {
    try {
      final response = await dio.get(
        'https://ecommerce.routemisr.com/api/v1/cart',
        options: Options(
          headers: {
            'token': token,
          },
        ),
      );
      return CartResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        return CartResponse.fromJson(e.response?.data);
      } else {
        return CartResponse(
          message: 'message error',
          statusMsg: 'statusMsg error',
        );
      }
    }
  }

  static Future<CartResponse> addProductToCart(
      {required String token, required String productId}) async {
    try {
      final response = await dio.post(
        'https://ecommerce.routemisr.com/api/v1/cart',
        data: {
          "productId": productId,
        },
        options: Options(
          headers: {
            'token': token,
          },
        ),
      );
      return CartResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        return CartResponse.fromJson(e.response?.data);
      } else {
        return CartResponse(
          message: 'message error',
          statusMsg: 'statusMsg error',
        );
      }
    }
  }

  static Future<CartResponse> updateProductCountInCart(
      {required String token, required String productId, required int count}) async {
    try {
      final response = await dio.put(
        'https://ecommerce.routemisr.com/api/v1/cart/$productId',
        data: {
          "count": count,
        },
        options: Options(
          headers: {
            'token': token,
          },
        ),
      );
      return CartResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        return CartResponse.fromJson(e.response?.data);
      } else {
        return CartResponse(
          message: 'message error',
          statusMsg: 'statusMsg error',
        );
      }
    }
  }

  static Future<CartResponse> deleteProductOfCart(
      {required String token, required String productId}) async {
    try {
      final response = await dio.delete(
        'https://ecommerce.routemisr.com/api/v1/cart/$productId',
        options: Options(
          headers: {
            'token': token,
          },
        ),
      );
      return CartResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        return CartResponse.fromJson(e.response?.data);
      } else {
        return CartResponse(
          message: 'message error',
          statusMsg: 'statusMsg error',
        );
      }
    }
  }

  static Future<WishlistResponse> addProductToWishlist(
      {required String token, required String productId}) async {
    try {
      final response = await dio.post(
        'https://ecommerce.routemisr.com/api/v1/wishlist',
        data: {
          "productId": productId,
        },
        options: Options(
          headers: {
            'token': token,
          },
        ),
      );
      return WishlistResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        return WishlistResponse.fromJson(e.response?.data);
      } else {
        return WishlistResponse(
          message: 'message error',
          statusMsg: 'statusMsg error',
        );
      }
    }
  }

  static Future<WishlistResponse> removeProductFromWishlist(
      {required String token, required String productId}) async {
    try {
      final response = await dio.delete(
        'https://ecommerce.routemisr.com/api/v1/wishlist/$productId',
        options: Options(
          headers: {
            'token': token,
          },
        ),
      );
      return WishlistResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        return WishlistResponse.fromJson(e.response?.data);
      } else {
        return WishlistResponse(
          message: 'message error',
          statusMsg: 'statusMsg error',
        );
      }
    }
  }

  static Future<WishlistResponse> getProductsFromWishlist({required String token}) async {
    try {
      final response = await dio.get(
        'https://ecommerce.routemisr.com/api/v1/wishlist',
        options: Options(
          headers: {
            'token': token,
          },
        ),
      );
      return WishlistResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        return WishlistResponse.fromJson(e.response?.data);
      } else {
        return WishlistResponse(
          message: 'message error',
          statusMsg: 'statusMsg error',
        );
      }
    }
  }
}
