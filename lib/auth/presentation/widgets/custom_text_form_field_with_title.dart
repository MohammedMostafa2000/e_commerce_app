import 'package:e_commerce_app/core/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormFieldWithTitle extends StatelessWidget {
  const CustomTextFormFieldWithTitle({
    super.key,
    required this.title,
    this.controller,
    this.textInputType,
    this.suffixIcon,
    required this.hintText,
    required this.obscureText,
  });
  final String title;
  final String hintText;
  final bool obscureText;

  final TextEditingController? controller;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: 16.h),
        TextFormField(
          obscureText: obscureText,
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: ColorsManager.darkBlue,
          ),
          cursorColor: ColorsManager.darkBlue,
          cursorHeight: 30.h,
          controller: controller,
          keyboardType: textInputType,
          decoration: InputDecoration(
            // labelStyle: GoogleFonts.poppins(
            //     fontSize: 18.sp,
            //     fontWeight: FontWeight.w300,
            //     color: Colors.black.withValues(alpha: 0.70)),

            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w300,
                color: Colors.black.withValues(alpha: 0.70)),
            suffixIcon: suffixIcon,
            suffixIconColor: Colors.black.withValues(alpha: 0.60),
            contentPadding: EdgeInsets.all(20.h),
            filled: true,
            fillColor: ColorsManager.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r)),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
