import 'package:e_commerce_app/mainLayout/data/models/wishlist_response.dart';

abstract class WishlistState {}

class WishlistInitialState extends WishlistState {}

class WishlistLoadingState extends WishlistState {}

class WishlistSuccessState extends WishlistState {
  WishlistResponse wishlistResponse;
  WishlistSuccessState({required this.wishlistResponse});
}

class WishlistErrorState extends WishlistState {
  String errorMessage;
  WishlistErrorState({required this.errorMessage});
}

class AddProductToWishlistLoadingState extends WishlistState {}

class AddProductToWishlistSuccessState extends WishlistState {
  String message;
  AddProductToWishlistSuccessState({required this.message});
}

class AddProductToWishlistErrorState extends WishlistState {
  String message;
  AddProductToWishlistErrorState({required this.message});
}

class RemoveProductFromWishlistLoadingState extends WishlistState {}

class RemoveProductFromWishlistSuccessState extends WishlistState {
  String message;
  RemoveProductFromWishlistSuccessState({required this.message});
}

class RemoveProductFromWishlistErrorState extends WishlistState {
  String message;
  RemoveProductFromWishlistErrorState({required this.message});
}
