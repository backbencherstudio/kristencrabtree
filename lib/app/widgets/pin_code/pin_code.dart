import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/constant/app_colors.dart';

class PinCode extends StatelessWidget {
  final Function(String) onCompleted;

  const PinCode({super.key, required this.onCompleted});

  @override
  Widget build(BuildContext context) {
    final otpController = TextEditingController();

    const borderColor = Color(0xffE9E9EA);

    return PinCodeTextField(
      appContext: context,
      length: 4,
      obscureText: false,
      controller: otpController,
      animationDuration: const Duration(milliseconds: 200),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,

      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8.r),
        fieldHeight: 48.h,
        fieldWidth: 54.w,
        activeBorderWidth: 1,
        selectedBorderWidth: 1.4,
        inactiveBorderWidth: 1,
        activeColor: Colors.blue,
        inactiveColor: Colors.grey,
        selectedColor: Colors.white,
        activeFillColor: Colors.transparent,
        selectedFillColor: Colors.transparent,
        inactiveFillColor: Colors.transparent,
      ),

      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 18.sp,

        fontWeight: FontWeight.w600,
      ),

      onChanged: (value) {
        if (value.length == 6) {
          onCompleted(value);
        }
      },
    );
  }
}
