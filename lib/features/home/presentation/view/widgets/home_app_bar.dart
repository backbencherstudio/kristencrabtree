
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kristencrabtree/core/constant/route_names.dart';

import '../../../../../core/constant/app_colors.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: statusBarHeight,
        left: 16.w,
        right: 16.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, RouteNames.profileScreen);
                },
                child: CircleAvatar(
                  radius: 28.r,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'assets/images/user.png',
                    width: 60.w,
                    height: 60.h,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Good morning, Google User',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'Your growth journey continues today',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 12.h),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: SvgPicture.asset(
              "assets/icons/notification.svg",
              width: 38.w,
              height: 38.h,
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(120.h);
}