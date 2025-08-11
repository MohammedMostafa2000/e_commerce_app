import 'package:e_commerce_app/mainLayout/data/models/product_d_m.dart';

class ProductDetailsResponse {
  ProductDM? product;
  String? message;
  String? error;
  ProductDetailsResponse({
    this.error,
    this.message,
    this.product,
  });
  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
    return ProductDetailsResponse(
        error: json['errors'] != null ? json['errors']['msg'] ?? '' : '',
        message: json['message'] ?? '',
        product: ProductDM.fromJson(json['data']));
  }
}
