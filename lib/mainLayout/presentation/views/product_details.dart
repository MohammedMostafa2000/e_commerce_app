import 'package:e_commerce_app/core/assets_manager.dart';
import 'package:e_commerce_app/core/colors_manager.dart';
import 'package:e_commerce_app/core/widgets/custom_action_widget.dart';
import 'package:e_commerce_app/core/widgets/custom_counter_widget.dart';
import 'package:e_commerce_app/core/widgets/custom_total_price_widget.dart';
import 'package:e_commerce_app/mainLayout/presentation/views/viewModels/product_details_cubit.dart';
import 'package:e_commerce_app/mainLayout/presentation/views/viewModels/productsViewModel/product_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({
    super.key,
    required this.productId,
  });
  final String productId;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int productCount = 1;
  late int totalPrice;
  late ProductDetailsCubit productDetailsCubit;

  @override
  void initState() {
    productDetailsCubit = ProductDetailsCubit()..loadProductDetails(productID: widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: productDetailsCubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Product Details',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          actions: [
            Padding(
              padding: REdgeInsets.only(right: 16),
              child: Row(
                children: [
                  CustomActionWidget(iconUrl: IconsManager.search),
                  SizedBox(width: 24.w),
                  CustomActionWidget(iconUrl: IconsManager.cart)
                ],
              ),
            ),
          ],
        ),
        body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return Center(child: CircularProgressIndicator(color: ColorsManager.lightBlue));
            } else if (state is SuccessState) {
              totalPrice = (state.productDM.price ?? 0) * productCount;
              return Padding(
                padding: REdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(color: ColorsManager.lightBlue),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: ImageSlideshow(
                            indicatorColor: ColorsManager.lightBlue,
                            indicatorRadius: 4.r,
                            indicatorBackgroundColor: ColorsManager.white,
                            height: 300.h,
                            width: double.infinity,
                            children: state.productDM.images!
                                .map(
                                  (image) => Image.network(
                                    image,
                                    fit: BoxFit.cover,
                                  ),
                                )
                                .toList()),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 240.w),
                          child: Text(
                            state.productDM.title ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                        Text(
                          'EGP ${state.productDM.price}',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(
                                color: ColorsManager.lightBlue,
                              )),
                          padding: REdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Text(
                            '${state.productDM.sold} Sold',
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Text(
                          '⭐ ${state.productDM.ratingsAverage} (${state.productDM.ratingsQuantity})',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        Spacer(),
                        CustomCounterWidget(
                          title: '$productCount',
                          addFunction: () {
                            setState(() {
                              productCount++;
                            });
                          },
                          removeFunction: () {
                            if (productCount <= 0) {
                              return;
                            }
                            setState(() {
                              productCount--;
                            });
                          },
                        )
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Description',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      state.productDM.description ?? '',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: ColorsManager.darkBlue.withValues(alpha: 60),
                          ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 100.h),
                    CustomTotalPriceWidget(
                      totalPrice: totalPrice,
                      buttonTitle: 'Add to cart',
                      onPressed: () {},
                      icon: Icons.add_shopping_cart_rounded,
                    )
                  ],
                ),
              );
            } else if (state is ErrorState) {
              return Center(child: Text(state.errorMessage));
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
