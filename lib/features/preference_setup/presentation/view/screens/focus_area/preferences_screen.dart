import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kristencrabtree/app/widgets/appbar/custom_app_bar.dart';
import 'package:kristencrabtree/app/widgets/buttons/primary_button.dart';
import 'package:kristencrabtree/app/widgets/cards/custom_card_base.dart';
import 'package:kristencrabtree/core/constant/route_names.dart';
import 'package:kristencrabtree/features/preference_setup/presentation/view/widgets/preferences_custom_stepper_widget.dart';
import 'package:kristencrabtree/features/preference_setup/presentation/view/widgets/stepper/content_pref_widget.dart';
import 'package:kristencrabtree/features/preference_setup/presentation/view/widgets/stepper/set_frequency_widget.dart';
import 'package:kristencrabtree/features/preference_setup/presentation/view/widgets/stepper/weekly_practice_widget.dart';
import 'package:kristencrabtree/features/preference_setup/presentation/view_model/preference_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../../gen/assets.gen.dart';
import '../../widgets/stepper/focus_area_widget.dart';

class PreferencesScreen extends StatelessWidget {
  const PreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> preferencesContent = [
      {
        'title': 'Choose Your Focus Areas',
        'subtitle': 'What aspects of yourself would you like to explore?',
      },
      {
        'title': 'Choose Your Weekly Practice',
        'subtitle':
            'Each question becomes a 4-step exercise: Question, Journal, Execution, and Reflection. Your progress will be saved. Select how many exercises you\'d like per week:',
      },
      {
        'title': 'Content Preferences',
        'subtitle': 'What types of content interest you most?',
      },
      {
        'title': 'Set Your Frequency',
        'subtitle': 'How often would you like to receive each type?',
      },
    ];

    Widget _getStepperContent(int index) {
      switch (index) {
        case 0:
          return FocusAreaWidget();
        case 1:
          return WeeklyPracticeWidget();
        case 2:
          return ContentPrefWidget();
        case 3:
          return SetFrequencyWidget();
        default:
          return FocusAreaWidget();
      }
    }

    final provider = context.watch<PreferenceProvider>();
    int _index = provider.selectedIndex;

    return Scaffold(
      appBar: CustomAppBar(title: ''),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: Column(
              spacing: 8.h,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  preferencesContent[_index]['title'],
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  preferencesContent[_index]['subtitle'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
                PreferencesCustomStepperWidget(completedSteps: _index + 1),
                SizedBox(height: 8.h),
                _getStepperContent(_index),
                SizedBox(height: 8.h),
                PrimaryButton(
                  onTap: () {
                    if (provider.selectedIndex == 3) {
                      context.read<PreferenceProvider>().resetIndex();
                      Navigator.pushNamed(context, RouteNames.loginScreen);
                    } else {
                      context.read<PreferenceProvider>().incIndex();
                    }
                  },
                  buttonTitle: 'Next',
                  isRounded: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
