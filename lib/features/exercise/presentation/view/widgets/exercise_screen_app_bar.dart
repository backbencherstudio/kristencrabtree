import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../gen/assets.gen.dart';

class ExerciseScreenAppBar extends StatelessWidget {
  const ExerciseScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Exercise', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500, color: Colors.black),),
        Spacer(),
        GestureDetector(
          onTap: (){},
          child: Container(
            height: 36.w,
            width: 36.w,
            padding: EdgeInsets.all(6),
            decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(90.r),
                border: Border.all(
                    color: AppColors.primary,
                    width: 1.w
                )
            ),
            child: SvgPicture.asset(Assets.icons.settings),
          ),
        )
      ],
    );
  }
}