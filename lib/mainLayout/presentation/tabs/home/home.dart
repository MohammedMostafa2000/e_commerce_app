import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/core/assets_manager.dart';
import 'package:e_commerce_app/core/colors_manager.dart';
import 'package:e_commerce_app/core/routes_manager.dart';
import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/mainLayout/data/models/category_d_m.dart';
import 'package:e_commerce_app/mainLayout/presentation/tabs/home/viewModels/home_cubit.dart';
import 'package:e_commerce_app/mainLayout/presentation/tabs/home/viewModels/home_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16.0),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return Center(
                  child: CircularProgressIndicator(
                color: ColorsManager.lightBlue,
              ));
            } else if (state is HomeSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(),
                  buildAdsSlider(),
                  SizedBox(height: 24.h),
                  Text(
                    'Categories',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  SizedBox(height: 16.h),
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      physics: BouncingScrollPhysics(),
                      // shrinkWrap: true,
                      itemCount: state.categories.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisExtent: 170.h,
                      ),
                      itemBuilder: (context, index) {
                        return buildCategoryItem(
                          context: context,
                          category: state.categories[index],
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RoutesManager.products,
                              arguments: state.categories[index].id as String,
                            );
                          },
                        );
                      },
                    ),
                  )
                ],
              );
            } else if (state is HomeError) {
              return Center(child: Text(state.errorMessage));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

Widget buildCategoryItem(
    {required BuildContext context, required CategoryDM category, void Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      children: [
        ClipOval(
          child: CachedNetworkImage(
            
            imageUrl: category.image ?? '',
            fit: BoxFit.cover,
            width: 100.w,
            height: 100.w,
            errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
          ),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          width: 100.w,
          child: Text(
            category.name!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelSmall,
            maxLines: 2,
          ),
        )
      ],
    ),
  );
}

Widget buildAdsSlider() {
  final List<String> adImages = [
    ImagesManager.adsSlider1,
    ImagesManager.adsSlider2,
    ImagesManager.adsSlider3,
  ];
  return SizedBox(
    height: 200.h,
    width: double.infinity,
    child: CarouselSlider(
      items: adImages
          .map((element) => ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  element,
                  fit: BoxFit.cover,
                  height: 200.h,
                  width: double.infinity,
                ),
              ))
          .toList(),
      options: CarouselOptions(
        autoPlay: false,
        viewportFraction: 1,
        enlargeCenterPage: false,
      ),
    ),
  );
}
