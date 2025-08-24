import 'package:e_commerce_app/mainLayout/data/models/cart_product_info.dart';

class CartResponse {
  String? statusMsg;
  String? message;
  String? status;
  int? numOfCartItems;
  String? cartId;
  String? cartOwner;
  String? createdAt;
  String? updatedAt;
  int? totalCartPrice;
  List<CartProductInfo>? products;
  CartResponse({
    this.statusMsg,
    this.message,
    this.status,
    this.numOfCartItems,
    this.cartId,
    this.cartOwner,
    this.createdAt,
    this.updatedAt,
    this.totalCartPrice,
    this.products,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) {
  final data = json['data'] as Map<String, dynamic>?; // خليها Map
  return CartResponse(
    status: json['status'] ?? '',
    numOfCartItems: json['numOfCartItems'] ?? 0,
    cartId: json['cartId'] ?? '',
    cartOwner: data?['cartOwner'] ?? '',
    createdAt: data?['createdAt'] ?? '',
    updatedAt: data?['updatedAt'] ?? '',
    totalCartPrice: data?['totalCartPrice'] ?? 0,
    message: json['message'] ?? '',
    statusMsg: json['statusMsg'] ?? '',
    products: (data?['products'] as List<dynamic>?)
            ?.map((e) => CartProductInfo.fromJson(e))
            .toList() ??
        [],
  );
}





  }

  // factory CartResponse.fromJson(Map<String, dynamic> json) {
  //   return CartResponse(
  //     status: json['status'] ?? '',
  //     numOfCartItems: json['numOfCartItems'] ?? 0,
  //     cartId: json['cartId'] ?? '',
  //     cartOwner: json['data']['cartOwner'] ?? '',
  //     createdAt: json['data']['createdAt'] ?? '',
  //     updatedAt: json['data']['updatedAt'] ?? '',
  //     totalCartPrice: json['data']['totalCartPrice'] ?? 0,
  //     message: json['message'] ?? '',
  //     statusMsg: json['statusMsg'] ?? '',
  //     products: json['data']['products'] == null
  //         ? []
  //         : List<CartProductInfo>.from(json['data']['products']),
  //   );
  // }

