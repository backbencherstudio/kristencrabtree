import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kristencrabtree/core/constant/app_colors.dart';

class CustomDropDownTextField extends StatelessWidget {
  final String? value;
  final String hintText;
  final List<String> items;
  final void Function(String?) onChanged;

  const CustomDropDownTextField({
    super.key,
    this.value,
    required this.hintText,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary, width: 1),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: AppColors.background,
          borderRadius: BorderRadius.circular(12.r),
          value: value,
          hint: Text(
            hintText,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          icon: Icon(Icons.keyboard_arrow_down_rounded,
              color: AppColors.primary),
          isExpanded: true,
          items: items
              .map(
                (e) => DropdownMenuItem(
              value: e,
              child: Text(
                e,
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
            ),
          )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
