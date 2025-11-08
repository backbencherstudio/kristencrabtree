import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../app/widgets/text_field/custom_textField.dart';
import '../../../../../gen/assets.gen.dart';

class CustomTextFieldWithName extends StatelessWidget {
  const CustomTextFieldWithName({
    super.key,
    required this.controller,
    required this.hintText,
    required this.title,
    this.isObscure,
    this.onTapSuffixIcon, this.hasIcon,
  });

  final TextEditingController controller;
  final String hintText;
  final String title;
  final bool? isObscure;
  final bool? hasIcon;
  final VoidCallback? onTapSuffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        CustomTextField(
          hintText: hintText,
          controller: controller,
          isObscure: isObscure,
          hasSuffixIcon: hasIcon ?? false,
          suffixIcon: isObscure ?? false
              ? SvgPicture.asset(Assets.icons.eye)
              : SvgPicture.asset(Assets.icons.eyeOff),
          onTapSuffixIcon: onTapSuffixIcon,
        ),
      ],
    );
  }
}
