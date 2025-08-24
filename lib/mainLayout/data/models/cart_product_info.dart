import 'package:e_commerce_app/mainLayout/data/models/product_d_m.dart';

class CartProductInfo {
  int? count;
  int? price;
  String? id;
  ProductDM? productDM;
  CartProductInfo({
    this.count,
    this.price,
    this.id,
    this.productDM,
  });
  factory CartProductInfo.fromJson(Map<String, dynamic> json) {
    return CartProductInfo(
        count: json['count'] ?? 0,
        id: json['_id'] ?? '',
        price: json['price'] ?? 0,
        productDM:
            json['product'] is Map<String, dynamic> ? ProductDM.fromJson(json['product']) : null);
  }
}
