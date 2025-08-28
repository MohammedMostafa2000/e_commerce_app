import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/assets_manager.dart';
import 'package:e_commerce_app/core/colors_manager.dart';
import 'package:e_commerce_app/core/widgets/custom_counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProductWidget extends StatelessWidget {
  const CustomProductWidget(
      {super.key,
      required this.productImage,
      required this.productTitle,
      this.deleteButton,
      required this.productPrice,
      required this.productCount,
      this.incrementProductCountButton,
      this.decrementProductCountButton,
      required this.title,
      required this.isWishlistTab,
      required this.onTap,
      this.onWishlistTapped});
  final String title;
  final String productImage;
  final String productTitle;
  final String productPrice;
  final String productCount;
  final bool isWishlistTab;
  final void Function()? deleteButton;
  final void Function()? incrementProductCountButton;
  final void Function()? decrementProductCountButton;
  final void Function()? onTap;
  final void Function()? onWishlistTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 112.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorsManager.lightBlue),
      ),
      child: Row(
        children: [
          Container(
            height: 112.h,
            width: 120.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  productImage,
                ),
              ),
              border: Border.all(color: ColorsManager.lightBlue),
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
          Expanded(
            child: Padding(
              padding: REdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 190.w),
                        child: Text(
                          productTitle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                      isWishlistTab
                          ? IconButton(
                              onPressed: onWishlistTapped,
                              icon: Icon(Icons.favorite),
                              color: ColorsManager.lightBlue,
                            )
                          : InkWell(
                              onTap: deleteButton,
                              child: Image.asset(
                                IconsManager.delete,
                                height: 26.h,
                                width: 26.w,
                              ),
                            ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        productPrice,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      InkWell(
                        onTap: onTap,
                        child: CustomCounterWidget(
                          isWishlistTab: isWishlistTab,
                          title: title,
                          addFunction: incrementProductCountButton,
                          removeFunction: decrementProductCountButton,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
