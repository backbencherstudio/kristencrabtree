import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kristencrabtree/app/widgets/buttons/primary_button.dart';
import 'package:kristencrabtree/core/constant/app_colors.dart';
import 'package:kristencrabtree/core/constant/route_names.dart';
import 'package:provider/provider.dart';

import '../../../../../../app/widgets/dialogs/congratulation_dialog.dart';
import '../../../../../../core/services/local_storage_service/preferences_storage.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../widgets/custom_plan_card.dart';
import '../../../view_model/plan_provider.dart';

class ChoosePaymentPlanScreen extends StatelessWidget {
  const ChoosePaymentPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final planProvider = context.watch<PlanProvider>();

    final List<Map<String, dynamic>> plans = [
      {
        'title': 'Free',
        'subTitle': 'Perfect for getting started',
        'price': '0',
        'type': 'month',
        'recommendation': 'Start the dig—no pressure, just curiosity.',
        'features': [
          'Limited journaling entries',
          'Daily quotes and inspiration',
          'Three question/exercise per week',
          'Read-only community access',
          'Basic progress tracking',
          'Ad-supported experience',
        ],
        'hasIcon': false,
        'iconPath': null,
        'tagImage': null,
      },
      {
        'title': 'Monthly',
        'subTitle': 'For those ready to go deeper',
        'price': '8.88',
        'type': 'month',
        'recommendation': 'For seekers who want presence to become a practice.',
        'features': [
          'Unlimited text & audio journaling',
          'Unlimited scheduled exercises & questions',
          'Full community participation (post & reply)',
          'Join Murmuration & collaborative experiences',
          'Access to live group sessions & one-on-one coaching',
          'Contribute personal inspirational messages',
          'Who Am I & Mind Expansion experiences',
          'Exclusive curated meditations',
          'Ad-free experience',
          'Advanced progress analytics & export',
        ],
        'hasIcon': true,
        'iconPath': Assets.icons.onboard1,
        'tagImage': Assets.images.popular.path,
      },
      {
        'title': 'Annual',
        'subTitle': 'For those ready to go deeper',
        'price': '53.28',
        'type': 'year',
        'recommendation': 'For seekers who want presence to become a practice.',
        'features': [
          'Unlimited text & audio journaling',
          'Unlimited scheduled exercises & questions',
          'Full community participation (post & reply)',
          'Join Murmuration & collaborative experiences',
          'Access to live group sessions & one-on-one coaching',
          'Contribute personal inspirational messages',
          'Who Am I & Mind Expansion experiences',
          'Exclusive curated meditations',
          'Ad-free experience',
          'Advanced progress analytics & export',
        ],
        'hasIcon': true,
        'iconPath': Assets.icons.onboard1,
        'tagImage': Assets.images.a50off.path,
      },
      {
        'title': 'Lifetime',
        'subTitle': 'The Lifetime Access',
        'price': '222.22',
        'type': 'one payment',
        'recommendation': 'For those who are all in.',
        'features': [
          'Everything in Premium, forever',
          'All future premium content & features',
          'Exclusive "The Dig Never Ends" special-edition tee',
          'One-time 45-minute private Excavation Session with Kristen',
          'Priority support & early access to new features',
          'Lifetime community member status',
        ],
        'hasIcon': true,
        'iconPath': Assets.icons.premium,
        'tagImage': Assets.images.special.path,
      },
    ];

    String _getText(int index) {
      switch (index) {
        case 0:
          return 'You can upgrade to Premium at any time';
        case 1:
          return 'Ad-free experience';
        case 2:
          return 'Ad-free experience';
        case 3:
          return 'Lifetime Premium experience';
        default:
          return 'You can upgrade to Premium at any time';
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: Column(
              spacing: 8.h,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.h),
                Image.asset(
                  Assets.images.appLogo.path,
                  height: 48.h,
                  width: 48.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 12.h),
                Text(
                  'Choose Your Journey',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  'Select the plan that best fits your growth goals',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 12.h),
                Column(
                  spacing: 8.h,
                  children: List.generate(plans.length, (index) {
                    final plan = plans[index];
                    final isSelected = planProvider.isSelected(index);

                    return GestureDetector(
                      onTap: () => planProvider.selectPlan(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primary
                                : Colors.transparent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(18.r),
                        ),
                        child: CustomPlanCard(
                          title: plan['title'],
                          subTitle: plan['subTitle'],
                          price: plan['price'],
                          type: plan['type'],
                          recommendation: plan['recommendation'],
                          features: plan['features'],
                          hasIcon: plan['hasIcon'],
                          iconPath: plan['iconPath'],
                          tagImage: plan['tagImage'],
                          borderColor: isSelected
                              ? AppColors.primary
                              : Colors.black12,
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 8.h),
                PrimaryButton(
                  onTap: () async {
                    CongratulationDialog.show(context, 'You\'re in!', () async {
                      await PreferencesStorage().saveToken('1');
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RouteNames.parentScreen,
                        (_) => false,
                      );
                    }, 'Go Home');
                  },
                  isRounded: true,
                  buttonTitle:
                      'Continue with ${plans[planProvider.selectedPlanIndex]['title']} Journey',
                ),

                Text(
                  _getText(planProvider.selectedPlanIndex),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
