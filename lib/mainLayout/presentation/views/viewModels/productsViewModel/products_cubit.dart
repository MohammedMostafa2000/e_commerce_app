import 'package:dio/dio.dart';
import 'package:e_commerce_app/mainLayout/data/remote/api_services.dart';
import 'package:e_commerce_app/mainLayout/presentation/views/viewModels/productsViewModel/products_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitialState());
  Future<void> getCategoryProducts({required String categoryId}) async {
    emit(ProductsLoadingState());
    try {
      final result = await ApiServices.getProductsBasedOnCategory(categoryId: categoryId);

      if (result.statusMsg == 'error') {
        emit(ProductsErrorStates(errorMessage: result.message ?? 'Unknown error'));
      } else {
        emit(ProductsSuccessStates(productsList: result.productsList ?? []));
      }
    } on DioException catch (e) {
      emit(ProductsErrorStates(errorMessage: e.toString()));
    }
  }
}
