import 'package:e_commerce_app/mainLayout/data/remote/api_services.dart';
import 'package:e_commerce_app/mainLayout/presentation/views/viewModels/wishlistViewModel/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitialState());
  Future<void> getProductsFromWishlist({required String token}) async {
    emit(WishlistLoadingState());
    try {
      var result = await ApiServices.getProductsFromWishlist(token: token);
      if (result.statusMsg == 'fail') {
        emit(WishlistErrorState(errorMessage: result.message!));
      }
      emit(WishlistSuccessState(wishlistResponse: result));
    } on Exception catch (e) {
      emit(WishlistErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> addProductToWishlist({required String token, required String productId}) async {
    emit(AddProductToWishlistLoadingState());
    try {
      var result = await ApiServices.addProductToWishlist(token: token, productId: productId);
      if (result.statusMsg == 'fail') {
        emit(AddProductToWishlistErrorState(message: result.message!));
      }
      emit(WishlistSuccessState(wishlistResponse: result));
    } on Exception catch (e) {
      emit(AddProductToWishlistErrorState(message: e.toString()));
    }
  }

  Future<void> removeProductfromWishlist({required String token, required String productId}) async {
    emit(RemoveProductFromWishlistLoadingState());
    try {
      var result = await ApiServices.removeProductFromWishlist(token: token, productId: productId);
      if (result.statusMsg == 'fail') {
        emit(RemoveProductFromWishlistErrorState(message: result.message!));
      }
      emit(WishlistSuccessState(wishlistResponse: result));
    } on Exception catch (e) {
      emit(RemoveProductFromWishlistErrorState(message: e.toString()));
    }
  }
}
