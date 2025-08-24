import 'package:e_commerce_app/mainLayout/data/models/product_d_m.dart';

abstract class ProductsState {}

class ProductsInitialState extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsSuccessStates extends ProductsState {
  List<ProductDM> productsList;
  ProductsSuccessStates({
    required this.productsList,
  });
}

class ProductsErrorStates extends ProductsState {
  String errorMessage;
  ProductsErrorStates({
    required this.errorMessage,
  });
}

