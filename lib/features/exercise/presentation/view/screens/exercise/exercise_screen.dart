import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kristencrabtree/app/widgets/cards/custom_card_base.dart';
import 'package:kristencrabtree/core/constant/app_colors.dart';
import 'package:kristencrabtree/core/constant/route_names.dart';
import 'package:kristencrabtree/features/exercise/presentation/view_model/emotional_body_excavation_screen_provider.dart';
import 'package:provider/provider.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../widgets/exercise_screen_app_bar.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: Column(
              spacing: 16.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExerciseScreenAppBar(),
                Text(
                  'Grow Yourself',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                CustomCardBase(
                  child: Column(
                    spacing: 8.h,
                    children: [
                      SvgPicture.asset(Assets.icons.trophy),
                      Text(
                        'Excavation Level',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Row(
                          spacing: 8.w,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(Assets.icons.bolt),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: '120 / 160  ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'XP to Level 2',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      LinearProgressIndicator(
                        value: 0.7,
                        color: AppColors.primary,
                        backgroundColor: AppColors.primary.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(16.r),
                        minHeight: 12.h,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        Assets.icons.bolt,
                        '1420',
                        'Total XP',
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: _buildStatCard(
                        Assets.icons.fire,
                        '12',
                        'Day Streak',
                      ),
                    ),
                  ],
                ),
                Text(
                  'Today\'s Dig',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    final completedDig = Provider.of<EmotionalBodyExcavationScreenProvider>(context, listen: false).completedDig;
                    if(completedDig == 2) {
                      Navigator.pushNamed(context, RouteNames.completedScreen);
                    } else {
                      Navigator.pushNamed(context, RouteNames.emotionalBodyExcavation);
                    }
                  },
                  child: CustomCardBase(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          Assets.icons.aiStar,
                          height: 20.w,
                          width: 20.w,
                        ),
                        Text(
                          'Emotional Body Excavation',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios_rounded, size: 16.w),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Color(0xffF8FAFB),
                  ),
                  child: Column(
                    spacing: 8.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 2.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: Colors.grey.shade200,
                            ),
                            child: Text(
                              'Ads',
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.close, size: 20.w),
                        ],
                      ),
                      Text(
                        'Ready for an ad-free experience?',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Upgrade to Premium and unlock unlimited access to all features',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: Colors.white,
                        ),
                        child: Text(
                          'Go Premium',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String iconPath, String title, String subTitle) {
    return CustomCardBase(
      child: Column(
        spacing: 4.h,
        children: [
          SvgPicture.asset(
            iconPath,
            height: 24.h,
            width: 24.h,
            fit: BoxFit.cover,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          Text(
            subTitle,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
