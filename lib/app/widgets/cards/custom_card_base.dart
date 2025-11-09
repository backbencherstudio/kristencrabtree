
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/app_colors.dart';

class CustomCardBase extends StatelessWidget {
  const CustomCardBase({
    super.key, required this.child, this.bgColor, this.borderColor, this.hasPadding,
  });

  final Color? bgColor;
  final Widget child;
  final Color? borderColor;
  final bool? hasPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: hasPadding ?? true ? EdgeInsets.all(16.w) : EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: bgColor ?? AppColors.background,
        border: Border.all(color: borderColor ?? AppColors.primary, width: 1.w),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: child,
    );
  }
}