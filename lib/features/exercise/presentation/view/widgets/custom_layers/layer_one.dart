import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../app/widgets/buttons/primary_button.dart';
import '../../../../../../app/widgets/cards/custom_card_base.dart';
import '../../../../../../app/widgets/text_field/custom_textField.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../view_model/emotional_body_excavation_screen_provider.dart';
import '../custom_radio_list.dart';
import '../custom_stepper.dart';

class LayerOne extends StatefulWidget {
  const LayerOne({super.key});

  @override
  State<LayerOne> createState() => _LayerOneState();
}

class _LayerOneState extends State<LayerOne> {

  final TextEditingController _thoughtController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _thoughtController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<EmotionalBodyExcavationScreenProvider>();
    return CustomCardBase(
      child: Column(
        spacing: 8.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Layer ${provider.completedSteps + 1}: Question',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          CustomStepper(totalSteps: 4, completedSteps: provider.completedSteps),
          Text(
            provider.completedDig == 0 ? 'Dig 1: Emotional Intelligence' : 'Dig 2: Pattern Awareness',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
          ),
          CustomCardBase(
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
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.primary,
                      ),
                      child: Text(
                        'Layer ${provider.completedSteps + 1}',
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                    Spacer(),
                    Image.asset(
                      Assets.images.xp.path,
                      height: 16.h,
                      fit: BoxFit.fitHeight,
                    ),
                  ],
                ),
                Text(
                  'The Question',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  'When you feel overwhelmed, what emotion is usually beneath the surface?',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          CustomRadioList(
            radioList: [
              'Fear',
              'Sadness',
              'Anger',
              'Shame',
              'Loneliness',
              'Other',
            ],
          ),
          if (provider.selectedOption == 'Other')
            CustomTextField(
              hintText: 'Share your thoughts......',
              controller: _thoughtController,
              maxLine: 4,
            ),
          SizedBox(height: 8.h),
          PrimaryButton(
            onTap: () {
              context.read<EmotionalBodyExcavationScreenProvider>().incrementCompletedSteps();
            },
            buttonTitle: 'Completed Layer ${provider.completedSteps + 1} of 4',
            isRounded: true,
          ),
        ],
      ),
    );
  }
}
