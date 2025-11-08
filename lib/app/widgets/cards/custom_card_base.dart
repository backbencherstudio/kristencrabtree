
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/app_colors.dart';

class CustomCardBase extends StatelessWidget {
  const CustomCardBase({
    super.key, required this.child, this.bgColor, this.borderColor,
  });

  final Color? bgColor;
  final Widget child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: bgColor ?? AppColors.background,
        border: Border.all(color: borderColor ?? AppColors.primary, width: 1.w),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: child,
    );
  }
}