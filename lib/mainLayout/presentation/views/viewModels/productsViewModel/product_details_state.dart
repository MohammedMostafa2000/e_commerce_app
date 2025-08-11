import 'package:e_commerce_app/mainLayout/data/models/product_d_m.dart';

abstract class ProductDetailsState {}

class InitialState extends ProductDetailsState {}

class LoadingState extends ProductDetailsState {}

class SuccessState extends ProductDetailsState {
  ProductDM productDM;
  SuccessState({required this.productDM});
}

class ErrorState extends ProductDetailsState {
  String errorMessage;
  ErrorState({required this.errorMessage});
}
