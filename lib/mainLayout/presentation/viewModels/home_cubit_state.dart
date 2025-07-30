import 'package:e_commerce_app/mainLayout/data/models/category_d_m.dart';

sealed class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<CategoryDM> categories;
  HomeSuccess({required this.categories});
}

class HomeError extends HomeState {
  final String errorMessage;
  HomeError({required this.errorMessage});
}
