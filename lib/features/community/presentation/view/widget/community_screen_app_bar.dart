import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kristencrabtree/core/constant/route_names.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../gen/assets.gen.dart';

class CommunityScreenAppBar extends StatelessWidget {
  const CommunityScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('The Murmuration Feed', style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500, color: Colors.black),),
        Spacer(),
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, RouteNames.createPostScreen);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 5.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.primary,
            ),
            child: Row(
              children: [
                SvgPicture.asset(Assets.icons.sent, height: 16.w, width: 16.w,),
                SizedBox(width: 8.w,),
                Text(
                  'Post',
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}