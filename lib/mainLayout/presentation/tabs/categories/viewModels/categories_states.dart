import 'package:e_commerce_app/mainLayout/data/models/category_d_m.dart';

abstract class CategoriesStates {}

class InitialState extends CategoriesStates {}

class LoadingState extends CategoriesStates {}

class SuccessState extends CategoriesStates {
  final List<CategoryDM> subCategories;
  SuccessState({
    required this.subCategories,
  });
}

class ErrorState extends CategoriesStates {
  final String subCategoriesErrorMessage;
  ErrorState({
    required this.subCategoriesErrorMessage,
  });
}
