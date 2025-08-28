import 'package:e_commerce_app/core/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCounterWidget extends StatelessWidget {
  const CustomCounterWidget({
    super.key,
    required this.title,
    this.addFunction,
    this.removeFunction,
    required this.isWishlistTab,
  });
  final String title;
  final void Function()? addFunction;
  final void Function()? removeFunction;
  final bool isWishlistTab;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      width: 122.w,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20.r), color: ColorsManager.lightBlue),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: isWishlistTab
            ? [
                Center(
                  child: Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: ColorsManager.white),
                  ),
                ),
              ]
            : [
                IconButton(
                  onPressed: removeFunction,
                  icon: Icon(
                    Icons.remove_circle_outline,
                    color: ColorsManager.white,
                  ),
                ),
                Center(
                  child: Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: ColorsManager.white),
                  ),
                ),
                IconButton(
                  onPressed: addFunction,
                  icon: Icon(
                    Icons.add_circle_outline_sharp,
                    color: ColorsManager.white,
                  ),
                )
              ],
      ),
    );
  }
}
