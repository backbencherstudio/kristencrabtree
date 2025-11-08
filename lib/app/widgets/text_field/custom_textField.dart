import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.maxLine,
    this.keyboardType,
    this.isObscure,
    this.suffixIcon,
    this.onTapSuffixIcon,
    this.hasSuffixIcon,
  });

  final String hintText;
  final TextEditingController controller;
  final int? maxLine;
  final TextInputType? keyboardType;
  final bool? isObscure;
  final bool? hasSuffixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTapSuffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLine ?? 1,
      keyboardType: keyboardType ?? TextInputType.text,
      obscureText: isObscure ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Color(0xff4A4C56), fontSize: 14.sp),
        filled: true,
        fillColor: Colors.white,
        suffixIcon: hasSuffixIcon ?? false
            ? GestureDetector(
                onTap: onTapSuffixIcon,
                child: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: suffixIcon,
                ),
              )
            : null,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.primary, width: 1.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.primary, width: 1.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.primary, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primary, width: 1.w),
        ),
      ),
      style: TextStyle(color: Colors.black87, fontSize: 14.sp),
      cursorColor: AppColors.primary,
    );
  }
}
