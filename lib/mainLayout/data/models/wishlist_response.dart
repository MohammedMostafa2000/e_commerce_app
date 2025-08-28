import 'package:e_commerce_app/mainLayout/data/models/product_d_m.dart';

class WishlistResponse {
  String? status;
  int? count;
  String? statusMsg;
  String? message;
  List<ProductDM>? products;
  WishlistResponse({
    this.status,
    this.count,
    this.statusMsg,
    this.message,
    this.products,
  });
  factory WishlistResponse.fromJson(Map<String, dynamic> json) {
    return WishlistResponse(
      count: json['count'] ?? 0,
      message: json['message'] ?? '',
      status: json['status'] ?? '',
      statusMsg: json['statusMsg'] ?? '',
      products: (json['data'] is List)
          ? (json['data'] as List)
              .whereType<Map<String, dynamic>>() // فلترة العناصر اللي نوعها Map
              .map((item) => ProductDM.fromJson(item))
              .toList()
          : [],
    );
  }
}
