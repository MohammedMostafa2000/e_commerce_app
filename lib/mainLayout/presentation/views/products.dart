import 'dart:developer';

import 'package:e_commerce_app/core/colors_manager.dart';
import 'package:e_commerce_app/core/routes_manager.dart';
import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/mainLayout/data/models/product_d_m.dart';
import 'package:e_commerce_app/mainLayout/presentation/views/viewModels/productsViewModel/products_cubit.dart';
import 'package:e_commerce_app/mainLayout/presentation/views/viewModels/productsViewModel/products_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Products extends StatefulWidget {
  const Products({super.key, required this.categoryId});
  final String categoryId;
  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  void initState() {
    context.read<ProductsCubit>().getCategoryProducts(categoryId: widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              if (state is ProductsLoadingState) {
                return Center(
                    child: CircularProgressIndicator(
                  color: ColorsManager.lightBlue,
                ));
              } else if (state is ProductsSuccessStates) {
                if (state.productsList.isEmpty) {
                  return Center(
                    child: Text('No Products Available'),
                  );
                }
                return Column(
                  children: [
                    CustomAppBar(),
                    Expanded(
                      child: GridView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: false,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16.h,
                            crossAxisSpacing: 16.w,
                            mainAxisExtent: 240),
                        itemCount: state.productsList.length,
                        itemBuilder: (context, index) {
                          return CustomProductCard(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RoutesManager.productDetails,
                                arguments: state.productsList[index].id as String,
                              );
                              log(state.productsList[index].id.toString());
                            },
                            productDM: state.productsList[index],
                          );
                        },
                      ),
                    )
                  ],
                );
              } else if (state is ProductsErrorStates) {
                return Center(child: Text(state.errorMessage));
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({
    super.key,
    required this.productDM,
    this.onTap,
  });
  final ProductDM productDM;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: 238.h,
            width: 190.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: ColorsManager.lightBlue),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                  child: Image.network(
                    productDM.imageCover ?? '',
                    height: 128.h,
                    width: 190,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productDM.title ?? '',
                        style: Theme.of(context).textTheme.labelSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        productDM.description ?? '',
                        style: Theme.of(context).textTheme.labelSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8.h),
                      // Row(
                      //   children: [
                      //     Text(
                      //       'EGP ${productDM.price}',
                      //       style: Theme.of(context).textTheme.labelSmall,
                      //     ),
                      //     SizedBox(width: 10.w),
                      //     Text(
                      //       '${(productDM.price ?? 0) * 1.5} EGP',
                      //       style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      //             decoration: TextDecoration.lineThrough,
                      //           ),
                      //     ),
                      //   ],
                      // ),
                      Text.rich(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'EGP ${productDM.price}   ',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            TextSpan(
                              text: '${(productDM.price ?? 0) * 1.5} EGP',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(decoration: TextDecoration.lineThrough),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Text(
                            'Review (${productDM.ratingsAverage}) ⭐',
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 238.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border_rounded,
                    color: ColorsManager.lightBlue,
                    size: 30.sp,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_circle,
                    color: ColorsManager.lightBlue,
                    size: 30.sp,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
