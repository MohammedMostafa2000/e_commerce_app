import 'package:e_commerce_app/core/assets_manager.dart';
import 'package:e_commerce_app/core/colors_manager.dart';
import 'package:e_commerce_app/core/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          ImagesManager.routeLogo,
          height: 22.h,
          width: 66.w,
        ),
        SizedBox(height: 18.h),
        Row(
          children: [
            Expanded(
              child: TextField(
                style: Theme.of(context).textTheme.displaySmall,
                cursorHeight: 26.h,
                cursorColor: ColorsManager.lightBlue,
                decoration: InputDecoration(
                  hintText: 'what do you search for?',
                  hintStyle: Theme.of(context).textTheme.displaySmall,
                  prefixIcon: Padding(
                    padding: REdgeInsets.all(12),
                    child: Image.asset(
                      IconsManager.search,
                      height: 24.h,
                      width: 24.w,
                    ),
                  ),
                  contentPadding: REdgeInsets.all(16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.r),
                    borderSide: BorderSide(color: ColorsManager.lightBlue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.r),
                    borderSide: BorderSide(color: ColorsManager.lightBlue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.r),
                    borderSide: BorderSide(color: ColorsManager.lightBlue),
                  ),
                ),
              ),
            ),
            SizedBox(width: 24.w),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesManager.cartView);
              },
              child: Image.asset(
                IconsManager.cart,
                height: 24.h,
                width: 24.w,
              ),
            )
          ],
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
