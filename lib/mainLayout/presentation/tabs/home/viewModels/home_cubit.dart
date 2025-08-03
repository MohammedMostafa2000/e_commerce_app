import 'package:e_commerce_app/mainLayout/data/remote/api_services.dart';
import 'package:e_commerce_app/mainLayout/presentation/tabs/home/viewModels/home_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  getCategories() async {
    try {
      emit(HomeLoading());
      final result = await ApiServices.getCategories();
      emit(HomeSuccess(categories: result.categoriesList ?? []));
    } on Exception catch (e) {
      emit(HomeError(errorMessage: e.toString()));
    }
  }
}
