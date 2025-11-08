import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../gen/assets.gen.dart';

class CustomCommentCard extends StatelessWidget {
  const CustomCommentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(90.r),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(90.r)
                ),
                child: Image.asset(Assets.images.user.path, height: 40.w, width: 40.w, fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 8.w,),
            Column(
              spacing: 2.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sarah Chen', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.black87),),
                Text('2 hours ago', style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400, color: Colors.black54),),
              ],
            ),
            Spacer(),
            SvgPicture.asset(Assets.icons.moreVertical, height: 20.w, width: 20.w,)
          ],
        ),
        Text('Beautiful reflection  learning to sit with discomfort instead of escaping it', style: TextStyle(color: Colors.black54, fontSize: 14.sp, fontWeight: FontWeight.w400),),
        Row(
          children: [
            Wrap(
              spacing: 8.w,
              children: [
                SvgPicture.asset(Assets.icons.heart, height: 20.w, width: 20.w,),
                Text('12', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black54),),
              ],
            ),
            SizedBox(width: 20.w,),
            Wrap(
              spacing: 8.w,
              children: [
                SvgPicture.asset(Assets.icons.cornerUpRight, height: 20.w, width: 20.w,),
                Text('12', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black54),),
              ],
            ),
            Spacer(),
            SvgPicture.asset(Assets.icons.share, height: 20.w, width: 20.w,),
          ],
        ),
        Divider(
          color: Colors.grey.shade300,
          thickness: 1.w,
        ),
      ],
    );
  }
}