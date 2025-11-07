import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kristencrabtree/core/constant/route_names.dart';
import 'package:kristencrabtree/features/parent/presentation/view_model/parent_screen_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../../app/widgets/appbar/custom_app_bar.dart';
import '../../../../../../app/widgets/cards/custom_card_base.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../view_model/emotional_body_excavation_screen_provider.dart';
import '../../widgets/custom_stepper.dart';
import '../../widgets/welldone_card.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<EmotionalBodyExcavationScreenProvider>();
    return Scaffold(
      appBar: CustomAppBar(title: 'Emotional Body Excavation', onBack: () {
        context.read<ParentScreenProvider>().changeIndex(0);
        Navigator.pushNamedAndRemoveUntil(context, RouteNames.parentScreen, (predicate) => false);
      },),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: Column(
              spacing: 16.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCardBase(
                  child: Column(
                    spacing: 8.h,
                    children: [
                      SvgPicture.asset(Assets.icons.success, height: 32.w, width: 32.w,),
                      Text(
                        'Congratulations',
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
                                    text: provider.completedDig == 1 ? 'Achieved 80 XP' : 'Achieved 160 XP',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' out of 160 XP',
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
                      Text(
                        'Keep digging to reveal your True Self!',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                provider.completedDig == 1
                    ? Column(
                        spacing: 16.h,
                        children: [
                          WellDoneCard(
                            isDone: true,
                            title: 'Dig 1 Completed! Well Done!!',
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pushReplacementNamed(
                              context,
                              RouteNames.emotionalBodyExcavation,
                            ),
                            child: WellDoneCard(
                              isDone: false,
                              title: 'Dig 2: Pattern Awareness',
                            ),
                          ),
                        ],
                      )
                    : Column(
                        spacing: 16.h,
                        children: [
                          WellDoneCard(
                            isDone: true,
                            title: 'Dig 1 Completed! Well Done!!',
                          ),
                          WellDoneCard(
                            isDone: true,
                            title: 'Dig 2 Completed! Well Done!!',
                          ),
                        ],
                      ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Emotional Body Excavation',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: CustomStepper(
                        totalSteps: 2,
                        completedSteps: provider.completedDig,
                        totalPoint: 160,
                        isLayerCount: false,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
