import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kristencrabtree/features/auth/presentation/view_model/login/login_screen_provider.dart';
import 'package:provider/provider.dart';
import '../../../../../../app/widgets/buttons/primary_button.dart';
import '../../../../../../app/widgets/buttons/social_buttons.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/constant/route_names.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../view_model/register/register_screen_provider.dart';
import '../../widgets/custom_text_field_with_name.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final registerProvider = context.watch<RegisterScreenProvider>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              spacing: 8.h,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20.h),
                Image.asset(
                  Assets.images.appLogo.path,
                  height: 48.h,
                  width: 48.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 12.h),
                Text(
                  'Join The Dig',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  'Begin your transformative journey',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFieldWithName(
                        controller: _firstNameController,
                        hintText: 'First name',
                        title: 'First Name',
                      ),
                    ),
                    SizedBox(width: 8.w,),
                    Expanded(
                      child: CustomTextFieldWithName(
                        controller: _lastNameController,
                        hintText: 'Last name',
                        title: 'Last Name',
                      ),
                    ),
                  ],
                ),
                CustomTextFieldWithName(
                  controller: _emailController,
                  hintText: 'Enter your email address',
                  title: 'Email Address',
                ),
                CustomTextFieldWithName(
                  controller: _passwordController,
                  hintText: 'Enter your password',
                  title: 'Password',
                  isObscure: registerProvider.isObscure1,
                  hasIcon: true,
                  onTapSuffixIcon: registerProvider.toggleObscure1,
                ),
                CustomTextFieldWithName(
                  controller: _confirmPasswordController,
                  hintText: 'Confirm your password',
                  title: 'Confirm Password',
                  isObscure: registerProvider.isObscure2,
                  hasIcon: true,
                  onTapSuffixIcon: registerProvider.toggleObscure2,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: registerProvider.isChecked,
                      onChanged: (value) {
                        registerProvider.toggleCheck(value!);
                      },
                      activeColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                          children: [
                            const TextSpan(text: 'I agree to the '),
                            TextSpan(
                              text: 'Terms of Service',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                              // recognizer: TapGestureRecognizer()..onTap = () {
                              //   Navigator.pushNamed(context, RouteNames.terms);
                              // },
                            ),
                            const TextSpan(text: ' and '),
                            TextSpan(
                              text: 'Privacy Policy.',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                              // recognizer: TapGestureRecognizer()..onTap = () {
                              //   Navigator.pushNamed(context, RouteNames.privacy);
                              // },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                PrimaryButton(
                  onTap: () {
                    Navigator.pushNamed(
                        context,
                        RouteNames.preferenceScreen,
                    );
                  },
                  buttonTitle: 'Sign up',
                  isRounded: true,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: Colors.black38, thickness: .75.w),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'or join with',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Divider(color: Colors.black38, thickness: .75.w),
                    ),
                  ],
                ),
                SocialButtons(),
                SizedBox(height: 20.h),
                RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(color: Colors.black, fontSize: 13.sp),
                    children: [
                      TextSpan(
                        text: 'Sign in',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              RouteNames.loginScreen,
                                (_) => false
                            );
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
