import 'package:e_commerce_app/auth/presentation/views/sign_in.dart';
import 'package:e_commerce_app/auth/presentation/views/sign_up.dart';
import 'package:e_commerce_app/mainLayout/presentation/views/cart_view.dart';
import 'package:e_commerce_app/mainLayout/presentation/views/main_layout_view.dart';
import 'package:e_commerce_app/mainLayout/presentation/views/product_details.dart';
import 'package:e_commerce_app/mainLayout/presentation/views/products.dart';
import 'package:flutter/material.dart';

abstract class RoutesManager {
  static const String mainLayout = '/mainLayout';
  static const String products = '/products';
  static const String productDetails = '/productDetails';
  static const String signUp = '/signUp';
  static const String signIn = '/signIn';
  static const String cartView = '/cartView';

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

      case signUp:
        return MaterialPageRoute(builder: (context) => SignUp());

      case signIn:
        return MaterialPageRoute(builder: (context) => SignIn());

      case cartView:
        return MaterialPageRoute(builder: (context) => CartView());
      default:
        return null;
    }
  }
}
