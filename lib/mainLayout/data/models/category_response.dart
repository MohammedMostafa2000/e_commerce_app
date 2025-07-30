import 'package:e_commerce_app/mainLayout/data/models/category_d_m.dart';

class CategoryResponse {
  int? results;
  List<CategoryDM>? categoriesList;
  String? statusMsg;
  String? message;

  CategoryResponse({
    this.results,
    this.categoriesList,
    this.statusMsg,
    this.message,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
      results: json['results'] as int?,
      categoriesList: (json['data'] as List<dynamic>?)
          ?.map((item) => CategoryDM.fromJson(item as Map<String, dynamic>))
          .toList(),
      statusMsg: json['statusMsg'],
      message: json['message'],
    );
  }
}
