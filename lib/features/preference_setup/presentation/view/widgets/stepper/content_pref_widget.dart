import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kristencrabtree/core/constant/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../../../../app/widgets/cards/custom_card_base.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../view_model/preference_provider.dart';

class ContentPrefWidget extends StatelessWidget {
  ContentPrefWidget({super.key});

  final List<Map<String, dynamic>> contentPrefContent = [
    {
      'title': 'Daily Wisdom Quotes',
      'icon': Assets.icons.quote,
    },
    {
      'title': 'Guided Exercises',
      'icon': Assets.icons.dart,
    },
    {
      'title': 'Meditation Content',
      'icon': Assets.icons.meditationP,
    },
    {
      'title': 'Community Discussions',
      'icon': Assets.icons.comment,
    },
    {
      'title': 'Journal Prompts',
      'icon': Assets.icons.list,
    },
    {
      'title': 'Scientific Insights',
      'icon': Assets.icons.telescope,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PreferenceProvider>();
    final selectedPrefs = provider.pref3;

    return Wrap(
      spacing: 16.w,
      runSpacing: 16.w,
      runAlignment: WrapAlignment.center,
      children: List.generate(contentPrefContent.length, (index) {
        final item = contentPrefContent[index];
        final isSelected = selectedPrefs.contains(item['title']);

        return GestureDetector(
          onTap: () {
            provider.togglePref3(item['title']);
          },
          child: SizedBox(
            width: 140.w,
            child: CustomCardBase(
              hasPadding: false,
              borderColor: isSelected ? AppColors.primary : Colors.black12,
              bgColor: isSelected
                  ? AppColors.primary.withOpacity(0.1)
                  : Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      item['icon'],
                      color: AppColors.primary,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      item['title'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w500,
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
