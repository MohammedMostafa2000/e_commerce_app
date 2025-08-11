import 'package:dio/dio.dart';
import 'package:e_commerce_app/mainLayout/data/remote/api_services.dart';
import 'package:e_commerce_app/mainLayout/presentation/views/viewModels/productsViewModel/product_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(InitialState());
  Future<void> loadProductDetails({required String productID}) async {
    emit(LoadingState());
    try {
      final result = await ApiServices.getSpecificProductDetails(productID: productID);
      if (result.message == 'fail') {
        emit(ErrorState(errorMessage: result.error ?? 'Unknown error'));
      } else {
        emit(SuccessState(productDM: result.product!));
      }
    } on DioException catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}
