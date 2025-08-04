import 'package:e_commerce_app/mainLayout/data/remote/api_services.dart';
import 'package:e_commerce_app/mainLayout/presentation/tabs/categories/viewModels/categories_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit() : super(InitialState());

  getSubCategories({required String categoryId}) async {
    try {
      emit(LoadingState());
      final response = await ApiServices.getSubCategoriesBasedOnCategory(categoryId: categoryId);
      emit(SuccessState(subCategories: response.categoriesList ?? []));
    } on Exception catch (e) {
      emit(ErrorState(subCategoriesErrorMessage: e.toString()));
    }
  }
}
