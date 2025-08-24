import 'package:e_commerce_app/core/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTotalPriceWidget extends StatelessWidget {
  const CustomTotalPriceWidget({
    super.key,
    required this.totalPrice,
    required this.buttonTitle,
    this.onPressed,
    required this.icon,
  });

  final int totalPrice;
  final String buttonTitle;
  final void Function()? onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total price',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: ColorsManager.darkBlue.withValues(alpha: 0.60),
                  ),
            ),
            SizedBox(height: 6.h),
            Text('EGP $totalPrice', style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
        Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(240.w, 48.h),
            foregroundColor: ColorsManager.white,
            backgroundColor: ColorsManager.lightBlue,
            iconSize: 24.sp,
            iconColor: ColorsManager.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            textStyle: GoogleFonts.poppins(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: ColorsManager.white,
            ),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(icon),
              Text(buttonTitle),
            ],
          ),
        )
      ],
    );
  }
}
