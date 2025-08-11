import 'package:e_commerce_app/mainLayout/presentation/views/main_layout_view.dart';
import 'package:e_commerce_app/mainLayout/presentation/views/product_details.dart';
import 'package:e_commerce_app/mainLayout/presentation/views/products.dart';
import 'package:flutter/material.dart';

abstract class RoutesManager {
  static const String mainLayout = '/mainLayout';
  static const String products = '/products';
  static const String productDetails = '/productDetails';

  static Route<dynamic>? goRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainLayout:
        return MaterialPageRoute(builder: (context) => MainLayoutView());

      case products:
        return MaterialPageRoute(
          builder: (context) => Products(categoryId: settings.arguments as String),
          settings: settings,
        );

      case productDetails:
        return MaterialPageRoute(
          builder: (context) => ProductDetails(productId: settings.arguments as String),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
