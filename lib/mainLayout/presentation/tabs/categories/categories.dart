import 'dart:developer';
import 'package:e_commerce_app/core/colors_manager.dart';
import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/mainLayout/presentation/tabs/categories/viewModels/categories_cubit.dart';
import 'package:e_commerce_app/mainLayout/presentation/tabs/categories/viewModels/categories_states.dart';
import 'package:e_commerce_app/mainLayout/presentation/tabs/home/viewModels/home_cubit.dart';
import 'package:e_commerce_app/mainLayout/presentation/tabs/home/viewModels/home_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  // final List<String> categories = [
  //   'Men’s Fashion',
  //   'Women’s Fashion',
  //   'Skincare',
  //   'Beauty',
  //   'Cameras',
  //   'Laptops & Electronics',
  // ];

  int selectedCategory = 0;

  String categoryId = '6439d61c0049ad0b52b90051';

  @override
  void initState() {
    context.read<CategoriesCubit>().getSubCategories(categoryId: categoryId);
    super.initState();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return SafeArea(
  //     child: Padding(
  //       padding: REdgeInsets.symmetric(horizontal: 16),
  //       child: SingleChildScrollView(
  //         child: Column(
  //           children: [
  //             CustomAppBar(),
  //             Row(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 BlocBuilder<HomeCubit, HomeState>(
  //                   builder: (context, state) {
  //                     if (state is HomeLoading) {
  //                       return Center(
  //                           child: CircularProgressIndicator(
  //                         color: ColorsManager.lightBlue,
  //                       ));
  //                     } else if (state is HomeSuccess) {
  //                       return Container(
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.only(
  //                             topLeft: Radius.circular(16.r),
  //                           ),
  //                           color: ColorsManager.offWhite,
  //                           border: Border(
  //                             left: BorderSide(color: ColorsManager.lightBlue),
  //                             top: BorderSide(color: ColorsManager.lightBlue),
  //                           ),
  //                         ),
  //                         width: 138.w,
  //                         child: ListView.builder(
  //                           shrinkWrap: true,
  //                           physics: const NeverScrollableScrollPhysics(),
  //                           itemCount: state.categories.length,
  //                           itemBuilder: (context, index) => InkWell(
  //                             onTap: () {
  //                               setState(() {
  //                                 selectedCategory = index;
  //                                 categoryId = state.categories[index].id ?? '';
  //                               });
  //                               log('Selected Category ID: $categoryId');

  //                               context
  //                                   .read<CategoriesCubit>()
  //                                   .getSubCategories(categoryId: categoryId); // ✅ تحميل جديد

  //                               log(index.toString());
  //                             },
  //                             child: Container(
  //                               padding: REdgeInsets.symmetric(horizontal: 8),
  //                               decoration: BoxDecoration(
  //                                 color: selectedCategory == index
  //                                     ? ColorsManager.white
  //                                     : ColorsManager.offWhite,
  //                                 borderRadius: const BorderRadius.horizontal(
  //                                   left: Radius.circular(16),
  //                                 ),
  //                               ),
  //                               alignment: Alignment.center,
  //                               height: 82.h,
  //                               width: 138.w,
  //                               child: Text(
  //                                 state.categories[index].name ?? '',
  //                                 textAlign: TextAlign.center,
  //                                 style: Theme.of(context)
  //                                     .textTheme
  //                                     .labelSmall!
  //                                     .copyWith(fontWeight: FontWeight.w500),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       );
  //                     } else if (state is HomeError) {
  //                       return Center(child: Text(state.errorMessage));
  //                     }

  //                     return SizedBox();
  //                   },
  //                 ),
  //                 SizedBox(width: 24.w),
  //                 BlocBuilder<CategoriesCubit, CategoriesStates>(
  //                   builder: (context, state) {
  //                     if (state is LoadingState) {
  //                       return Center(
  //                         child: CircularProgressIndicator(
  //                           color: ColorsManager.lightBlue,
  //                         ),
  //                       );
  //                     } else if (state is SuccessState) {
  //                       return Expanded(
  //                         child: Container(
  //                           color: ColorsManager.white,
  //                           child: GridView.builder(
  //                             shrinkWrap: true,
  //                             physics: const NeverScrollableScrollPhysics(),
  //                             itemCount: state.subCategories.length,
  //                             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                               crossAxisCount: 3,
  //                               crossAxisSpacing: 12.w,
  //                               mainAxisExtent: 130.h,
  //                             ),
  //                             itemBuilder: (context, index) => Column(
  //                               crossAxisAlignment: CrossAxisAlignment.center,
  //                               children: [
  //                                 Container(
  //                                   height: 70.h,
  //                                   width: 70.w,
  //                                   decoration: BoxDecoration(
  //                                     image: const DecorationImage(
  //                                       fit: BoxFit.cover,
  //                                       image: AssetImage(
  //                                         'assets/images/subCategory.png',
  //                                       ),
  //                                     ),
  //                                     borderRadius: BorderRadius.circular(8.r),
  //                                   ),
  //                                 ),
  //                                 SizedBox(height: 8.h),
  //                                 Text(
  //                                   state.subCategories[index].name ?? '',
  //                                   overflow: TextOverflow.ellipsis,
  //                                   maxLines: 2,
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                         ),
  //                       );
  //                     } else if (state is ErrorState) {
  //                       return Center(child: Text(state.subCategoriesErrorMessage));
  //                     }
  //                     return SizedBox();
  //                   },
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            // ✅ ثابت
            CustomAppBar(),

            // ✅ الجزء المتحرك
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if (state is HomeLoading) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: ColorsManager.lightBlue,
                          ),
                        );
                      } else if (state is HomeSuccess) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.r),
                            ),
                            color: ColorsManager.offWhite,
                            border: Border(
                              left: BorderSide(color: ColorsManager.lightBlue),
                              top: BorderSide(color: ColorsManager.lightBlue),
                            ),
                          ),
                          width: 138.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.horizontal(left: Radius.circular(16.r)),
                            child: ListView.builder(
                              itemCount: state.categories.length,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedCategory = index;
                                    categoryId = state.categories[index].id ?? '';
                                  });
                                  log('Selected Category ID: $categoryId');
                                  context
                                      .read<CategoriesCubit>()
                                      .getSubCategories(categoryId: categoryId);
                                },
                                child: Container(
                                  padding: REdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: selectedCategory == index
                                        ? ColorsManager.white
                                        : ColorsManager.offWhite,
                                    borderRadius: const BorderRadius.horizontal(
                                      left: Radius.circular(16),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: 82.h,
                                  width: 138.w,
                                  child: Text(
                                    state.categories[index].name ?? '',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else if (state is HomeError) {
                        return Center(child: Text(state.errorMessage));
                      }
                      return SizedBox();
                    },
                  ),
                  SizedBox(width: 24.w),
                  Expanded(
                    child: BlocBuilder<CategoriesCubit, CategoriesStates>(
                      builder: (context, state) {
                        if (state is LoadingState) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: ColorsManager.lightBlue,
                            ),
                          );
                        } else if (state is SuccessState) {
                          return GridView.builder(
                            padding: REdgeInsets.only(top: 8),
                            itemCount: state.subCategories.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 12.w,
                              mainAxisExtent: 130.h,
                            ),
                            itemBuilder: (context, index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 70.h,
                                  width: 70.w,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'assets/images/subCategory.png',
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  state.subCategories[index].name ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          );
                        } else if (state is ErrorState) {
                          return Center(
                            child: Text(state.subCategoriesErrorMessage),
                          );
                        }
                        return SizedBox();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
