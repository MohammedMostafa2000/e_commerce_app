import 'package:e_commerce_app/core/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCounterWidget extends StatelessWidget {
  const CustomCounterWidget({
    super.key,
    required this.title,
    this.addFunction,
    this.removeFunction,
  });
  final String title;
  final void Function()? addFunction;
  final void Function()? removeFunction;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      width: 122.w,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20.r), color: ColorsManager.lightBlue),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: removeFunction,
            // onPressed: () {
            //   if (productCount <= 0) {
            //     return;
            //   }
            //   setState(() {
            //     productCount--;
            //   });
            // },
            icon: Icon(
              Icons.remove_circle_outline,
              color: ColorsManager.white,
            ),
          ),
          Text(
            // '$productCount',
            title,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(color: ColorsManager.white),
          ),
          IconButton(
            onPressed: addFunction,
            // onPressed: () {
            //   // setState(() {
            //   //   productCount++;
            //   // });
            // },
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
