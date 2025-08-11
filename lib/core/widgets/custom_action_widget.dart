import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomActionWidget extends StatelessWidget {
  const CustomActionWidget({
    super.key,
    required this.iconUrl,
    this.onTap,
  });
  final String iconUrl;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        iconUrl,
        height: 24.h,
        width: 24.w,
      ),
    );
  }
}
