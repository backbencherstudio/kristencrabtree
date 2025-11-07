
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../gen/assets.gen.dart';

class WellDoneCard extends StatelessWidget {
  const WellDoneCard({super.key, required this.title, required this.isDone});

  final String title;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: isDone ? AppColors.primary : AppColors.background,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isDone ? Colors.transparent : AppColors.primary,
          width: 1.w,
        ),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: isDone ? Colors.white : Colors.black54,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacer(),
          isDone
              ? SvgPicture.asset(Assets.icons.tik, height: 20.w, width: 20.w)
              : SizedBox(),
        ],
      ),
    );
  }
}