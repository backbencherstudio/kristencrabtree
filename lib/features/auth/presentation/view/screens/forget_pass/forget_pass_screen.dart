import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kristencrabtree/app/widgets/buttons/primary_button.dart';
import 'package:kristencrabtree/core/constant/route_names.dart';

import '../../widgets/custom_text_field_with_name.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {

  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: Column(
              spacing: 8.h,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 120.h,),
                Text(
                  'Forget Password',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                CustomTextFieldWithName(
                  controller: _emailController,
                  hintText: 'Enter your email address',
                  title: 'Email Address',
                ),
                SizedBox(height: 120.h,),
                PrimaryButton(onTap: () {
                  Navigator.pushNamed(context, RouteNames.verifyOtpScreen);
                }, buttonTitle: 'Next', isRounded: true,),
                SizedBox(height: 40.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
