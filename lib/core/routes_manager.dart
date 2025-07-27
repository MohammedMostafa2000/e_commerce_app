import 'package:e_commerce_app/mainLayout/presentation/views/main_layout_view.dart';
import 'package:flutter/material.dart';

abstract class RoutesManager {
  static const String mainLayout = '/mainLayout';

  static Route<dynamic>? goRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainLayout:
        return MaterialPageRoute(builder: (context) => MainLayoutView());
      default:
        return null;
    }
  }
}
