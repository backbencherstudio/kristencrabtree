import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kristencrabtree/core/constant/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../../../../app/widgets/cards/custom_card_base.dart';
import '../../../../../../app/widgets/text_field/custom_drop_down_text_field.dart';
import '../../../view_model/preference_provider.dart';

class SetFrequencyWidget extends StatelessWidget {
  SetFrequencyWidget({super.key});

  final List<String> frequencyContent = [
    'Daily Wisdom Quotes',
    'Guided Exercises',
    'Meditation Content',
    'Community Discussions',
    'Journal Prompts',
    'Scientific Insights',
  ];

  final List<String> frequencyOptions = [
    'Daily',
    'Weekly',
    'Occasionally',
  ];

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PreferenceProvider>();

    return Column(
      spacing: 12.h,
      children: List.generate(frequencyContent.length, (index) {
        final item = frequencyContent[index];

        return CustomCardBase(
          hasPadding: false,
          borderColor: Colors.black12,
          bgColor: AppColors.background,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Expanded(
                  child: Text(
                    item,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                SizedBox(
                  width: 120.w,
                  child: CustomDropDownTextField(
                    hintText: 'Select',
                    value: provider.getFrequency(item) ?? 'Daily',
                    items: frequencyOptions,
                    onChanged: (value) {
                      if (value != null) {
                        provider.setFrequency(item, value);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
