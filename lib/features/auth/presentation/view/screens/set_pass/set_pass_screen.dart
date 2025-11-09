import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kristencrabtree/features/auth/presentation/view_model/reset_password_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../../app/widgets/buttons/primary_button.dart';
import '../../../../../../core/constant/route_names.dart';
import '../../widgets/custom_text_field_with_name.dart';

class SetPassScreen extends StatefulWidget {
  const SetPassScreen({super.key});

  @override
  State<SetPassScreen> createState() => _SetPassScreenState();
}

class _SetPassScreenState extends State<SetPassScreen> {
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final setPassProvider = context.watch<ResetPasswordProvider>();
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
                SizedBox(height: 120.h),
                Text(
                  'Set New Password',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                CustomTextFieldWithName(
                  controller: _passController,
                  hintText: 'Enter your password',
                  title: 'Password',
                  isObscure: setPassProvider.isObscure1,
                  hasIcon: true,
                  onTapSuffixIcon: setPassProvider.toggleObscure1,
                ),
                CustomTextFieldWithName(
                  controller: _confirmPassController,
                  hintText: 'Confirm your password',
                  title: 'Confirm Password',
                  isObscure: setPassProvider.isObscure2,
                  hasIcon: true,
                  onTapSuffixIcon: setPassProvider.toggleObscure2,
                ),
                SizedBox(height: 120.h),
                PrimaryButton(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RouteNames.loginScreen,
                      (_) => false,
                    );
                  },
                  buttonTitle: 'Update Password',
                  isRounded: true,
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
