import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kristencrabtree/core/constant/app_colors.dart';

class PreferencesCustomStepperWidget extends StatelessWidget {
  final int completedSteps;

  const PreferencesCustomStepperWidget({
    super.key,
    required this.completedSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(4, (index) {
            final isCompleted = index < completedSteps;
            return Expanded(
              child: Container(
                height: 6.h,
                margin: EdgeInsets.symmetric(horizontal: 3.w),
                decoration: BoxDecoration(
                  color: isCompleted
                      ? AppColors.primary.withOpacity(0.75)
                      : AppColors.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
