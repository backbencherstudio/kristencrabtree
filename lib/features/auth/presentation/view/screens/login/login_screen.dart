import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kristencrabtree/core/services/local_storage_service/preferences_storage.dart';
import 'package:kristencrabtree/features/auth/presentation/view_model/login/login_screen_provider.dart';
import 'package:provider/provider.dart';
import '../../../../../../app/widgets/buttons/primary_button.dart';
import '../../../../../../app/widgets/buttons/social_buttons.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/constant/route_names.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../widgets/custom_text_field_with_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = context.watch<LoginScreenProvider>();
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
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  'Continue your journey of self-discovery',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 12.h),
                CustomTextFieldWithName(
                  controller: _emailController,
                  hintText: 'Enter your email address',
                  title: 'Email Address',
                ),
                CustomTextFieldWithName(
                  controller: _passwordController,
                  hintText: 'Enter your password',
                  title: 'Password',
                  isObscure: loginProvider.isObscure,
                  hasIcon: true,
                  onTapSuffixIcon: loginProvider.toggleObscure,
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, RouteNames.forgetPassScreen),
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                PrimaryButton(
                  onTap: () async {
                    final prefToken = await PreferencesStorage().getToken();
                    if (prefToken != null) {
                      Navigator.pushNamedAndRemoveUntil(context, RouteNames.parentScreen, (_) => false);
                    } else {
                      Navigator.pushNamedAndRemoveUntil(context, RouteNames.preferenceScreen, (_) => false);
                    }
                  },
                  buttonTitle: 'Sign in',
                  isRounded: true,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: Colors.black38, thickness: .75.w),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'or login with',
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
                    text: 'Don\'t have an account? ',
                    style: TextStyle(color: Colors.black, fontSize: 13.sp),
                    children: [
                      TextSpan(
                        text: 'Sign up',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(
                              context,
                              RouteNames.registerScreen,
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
