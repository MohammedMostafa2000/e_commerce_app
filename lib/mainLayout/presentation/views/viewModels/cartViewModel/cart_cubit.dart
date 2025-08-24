import 'package:dio/dio.dart';
import 'package:e_commerce_app/mainLayout/data/remote/api_services.dart';
import 'package:e_commerce_app/mainLayout/presentation/views/viewModels/cartViewModel/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitialState());

  Future<void> getCartDetails({required String token}) async {
    emit(CartLoadingState());

    try {
      final result = await ApiServices.getCartDetails(token: token);

      if (result.statusMsg != null && result.statusMsg == 'error') {
        emit(CartErrorState(errorMessage: result.message ?? ''));
      } else {
        emit(CartSuccessState(cartResponse: result));
      }
    } on DioException catch (e) {
      emit(CartErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> addProductToCart({required String token, required String productId}) async {
    emit(LoadingAddProductState());
    try {
      final result = await ApiServices.addProductToCart(
        productId: productId,
        token: token,
      );

      if (result.statusMsg == 'error') {
        emit(ErrorAddProductState(errorMessage: result.message!));
      } else {
        emit(CartSuccessState(cartResponse: result));
        // emit(SuccessAddProductState(successMessage: result.message!));
      }
    } on DioException catch (e) {
      emit(ErrorAddProductState(errorMessage: e.toString()));
    }
  }

  Future<void> updateProductCountInCart({
    required String token,
    required String productId,
    required int count,
  }) async {
    emit(LoadingUpdateCartState());
    try {
      final result = await ApiServices.updateProductCountInCart(
        count: count,
        productId: productId,
        token: token,
      );

      if (result.statusMsg == 'error') {
        emit(ErrorUpdateCartState(errorMessage: result.message!));
      } else {
        emit(CartSuccessState(cartResponse: result));
        // emit(SuccessUpdateCartState(successMessage: result.message!));
      }
    } on DioException catch (e) {
      emit(ErrorUpdateCartState(errorMessage: e.toString()));
    }
  }

  Future<void> deleteProductOfCart({required String token, required String productId}) async {
    emit(LoadingDeleteProductOfCartState());
    try {
      final result = await ApiServices.deleteProductOfCart(
        productId: productId,
        token: token,
      );

      if (result.statusMsg == 'error') {
        emit(ErrorDeleteProductOfCartState(errorMessage: result.message!));
      } else {
        emit(CartSuccessState(cartResponse: result));
        // emit(SuccessDeleteProductOfCartState(successMessage: result.message!));
      }
    } on DioException catch (e) {
      emit(ErrorDeleteProductOfCartState(errorMessage: e.toString()));
    }
  }
}
