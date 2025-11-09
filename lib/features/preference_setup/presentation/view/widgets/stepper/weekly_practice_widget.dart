import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kristencrabtree/core/constant/app_colors.dart';
import 'package:provider/provider.dart';
import '../../../../../../app/widgets/cards/custom_card_base.dart';
import '../../../view_model/preference_provider.dart';

class WeeklyPracticeWidget extends StatelessWidget {
  WeeklyPracticeWidget({super.key});

  final List<Map<String, dynamic>> weeklyPracticeContent = [
    {
      'title': '1-3 Exercises/Week',
      'subtitle': 'Gentle engagement and flexibility.',
      'icon': 'Light',
    },
    {
      'title': '4-7 Exercises/Week',
      'subtitle': 'Balanced pace for steady growth.',
      'icon': 'Moderate',
    },
    {
      'title': '8-15 Exercises/Week',
      'subtitle': 'Consistent, immersive routine.',
      'icon': 'Deep',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PreferenceProvider>();
    final selectedIndex = provider.exerciseSelectedIndex;

    return Column(
      spacing: 8.h,
      children: List.generate(weeklyPracticeContent.length, (index) {
        final item = weeklyPracticeContent[index];
        final isSelected = selectedIndex == index;

        return GestureDetector(
          onTap: () {
            context.read<PreferenceProvider>().setExerciseIndex(index);
            context.read<PreferenceProvider>().setPref2(item['title']);
          },
          child: CustomCardBase(
            borderColor: isSelected ? AppColors.primary : Colors.black12,
            bgColor: isSelected ? AppColors.primary.withOpacity(0.1) : AppColors.background,
            child: Row(
              children: [
                Radio<int>(
                  value: index,
                  groupValue: selectedIndex,
                  onChanged: (value) {
                    if (value != null) {
                      context.read<PreferenceProvider>().setExerciseIndex(
                        value,
                      );
                    }
                  },
                  activeColor: AppColors.primary,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title'],
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        item['subtitle'],
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(16.r)
                  ),
                  child: Text(item['icon'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11.sp),),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
