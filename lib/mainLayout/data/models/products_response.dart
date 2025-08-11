import 'package:e_commerce_app/mainLayout/data/models/product_d_m.dart';

class ProductsResponse {
  int? results;
  List<ProductDM>? productsList;
  String? statusMsg;
  String? message;

  ProductsResponse({
    this.results,
    this.productsList,
    this.statusMsg,
    this.message,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse(
      results: json['results'] ?? 0,
      productsList: json['data'] != null
          ? List<ProductDM>.from(
              (json['data'] as List).map((item) => ProductDM.fromJson(item)),
            )
          : [],
      statusMsg: json['statusMsg'] ?? '',
      message: json['message'] ?? '',
    );
  }
}
