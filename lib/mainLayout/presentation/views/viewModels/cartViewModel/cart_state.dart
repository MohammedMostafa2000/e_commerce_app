import 'package:e_commerce_app/mainLayout/data/models/cart_response.dart';

abstract class CartState {}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartSuccessState extends CartState {
  CartResponse cartResponse;
  CartSuccessState({required this.cartResponse});
}

class CartErrorState extends CartState {
  String errorMessage;
  CartErrorState({required this.errorMessage});
}

class LoadingAddProductState extends CartState {}

class SuccessAddProductState extends CartState {
  String successMessage;
  SuccessAddProductState({required this.successMessage});
}

class ErrorAddProductState extends CartState {
  String errorMessage;
  ErrorAddProductState({required this.errorMessage});
}

class LoadingUpdateCartState extends CartState {}

class SuccessUpdateCartState extends CartState {
  String successMessage;
  SuccessUpdateCartState({required this.successMessage});
}

class ErrorUpdateCartState extends CartState {
  String errorMessage;
  ErrorUpdateCartState({required this.errorMessage});
}

class LoadingDeleteProductOfCartState extends CartState {}

class SuccessDeleteProductOfCartState extends CartState {
  String successMessage;
  SuccessDeleteProductOfCartState({required this.successMessage});
}

class ErrorDeleteProductOfCartState extends CartState {
  String errorMessage;
  ErrorDeleteProductOfCartState({required this.errorMessage});
}
