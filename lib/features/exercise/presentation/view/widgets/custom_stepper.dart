import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kristencrabtree/core/constant/app_colors.dart';

class CustomStepper extends StatelessWidget {
  final int totalSteps;
  final int completedSteps;
  final bool? isLayerCount;
  final int? totalPoint;

  const CustomStepper({
    super.key,
    required this.totalSteps,
    required this.completedSteps, this.isLayerCount, this.totalPoint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(totalSteps, (index) {
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

        SizedBox(height: 6.h),

        isLayerCount ?? true ? Text(
          'Completed Layer: $completedSteps/$totalSteps',
          style: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade600,
          ),
        ) : Row(
          children: [
            Text(
              'Dig Completed: $completedSteps/$totalSteps',
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade600,
              ),
            ),
            Spacer(),
            if (totalPoint != null)
              Text(
                'Points Gained: ${((totalPoint! / 2) * completedSteps).round()}/$totalPoint',
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade600,
                ),
              )
          ],
        ),
      ],
    );
  }
}
