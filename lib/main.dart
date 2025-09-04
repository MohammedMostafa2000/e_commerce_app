import 'package:e_commerce_app/config/theme_manager.dart';
import 'package:e_commerce_app/core/di/di.dart';
import 'package:e_commerce_app/core/routes_manager.dart';
import 'package:e_commerce_app/core/token_cubit/token_cubit.dart';
import 'package:e_commerce_app/mainLayout/presentation/tabs/categories/viewModels/categories_cubit.dart';
import 'package:e_commerce_app/mainLayout/presentation/tabs/home/viewModels/home_cubit.dart';
import 'package:e_commerce_app/mainLayout/presentation/views/viewModels/productsViewModel/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TokenCubit()..getToken()),
        BlocProvider(create: (context) => HomeCubit()..getCategories()),
        BlocProvider(create: (context) => CategoriesCubit()),
        BlocProvider(create: (context) => ProductsCubit()),
      ],
      child: ECommerceApp(),
    ),
  );
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
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesManager.signIn,
        onGenerateRoute: RoutesManager.goRoute,
        locale: Locale('en'),
        theme: ThemeManager.light,
        darkTheme: ThemeManager.dark,
        themeMode: ThemeMode.light,
      ),
    );
  }
}

extension ContextEx on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}
