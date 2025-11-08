import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kristencrabtree/core/constant/app_colors.dart';
import 'package:provider/provider.dart';

import '../../view_model/emotional_body_excavation_screen_provider.dart';

class CustomRadioList extends StatelessWidget {
  const CustomRadioList({super.key, required this.radioList, required this.index});

  final List<String> radioList;
  final int index;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<EmotionalBodyExcavationScreenProvider>();
    return Column(
      children: radioList.map((option) {
        final selectedOption = (index == 1) ? provider.selectedOption1 : provider.selectedOption2;
        final isSelected = option == selectedOption;

        return GestureDetector(
          onTap: () {
            (index == 1) ? context.read<EmotionalBodyExcavationScreenProvider>().setSelectedOption1(option) : context.read<EmotionalBodyExcavationScreenProvider>().setSelectedOption2(option);
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFFFBF8F0)
                  : Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: isSelected
                    ? AppColors.primary
                    : Colors.grey.shade400,
                width: 1.2,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Radio<String>(
                  value: option,
                  groupValue: index == 1 ? provider.selectedOption1 : provider.selectedOption2,
                  onChanged: (value) {
                    (index == 1) ? context.read<EmotionalBodyExcavationScreenProvider>().setSelectedOption1(value!) : context.read<EmotionalBodyExcavationScreenProvider>().setSelectedOption2(value!);
                  },
                  activeColor: AppColors.primary
                ),
                SizedBox(width: 6.w),
                Expanded(
                  child: Text(
                    option,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight:
                      isSelected ? FontWeight.w500 : FontWeight.w400,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
