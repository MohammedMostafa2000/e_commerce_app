import 'package:e_commerce_app/config/theme_manager.dart';
import 'package:e_commerce_app/core/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(context.width, context.height),
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => 
       MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesManager.mainLayout,
        onGenerateRoute: RoutesManager.goRoute,
        locale: Locale('en'),
        theme: ThemeManager.light,
        darkTheme: ThemeManager.dark,
        themeMode: ThemeMode.light,
      
      ),
    );
  }
}
extension ContextEx on BuildContext{
double get width=> MediaQuery.of(this).size.width;
double get height=> MediaQuery.of(this).size.height;
}