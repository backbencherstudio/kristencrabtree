import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kristencrabtree/app/widgets/buttons/primary_button.dart';
import 'package:kristencrabtree/app/widgets/buttons/social_buttons.dart';
import 'package:kristencrabtree/core/constant/app_colors.dart';

import '../../../../../../core/constant/route_names.dart';
import '../../../../../../gen/assets.gen.dart';

class SignUpSelectionScreen extends StatelessWidget {
  const SignUpSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            spacing: 8.h,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Image.asset(Assets.images.appLogo.path, height: 48.h, width: 48.h, fit: BoxFit.cover,),
              SizedBox(height: 12.h,),
              Text('Join The Dig', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold, color: Colors.black87),),
              Text('Begin your transformative journey', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black54),),
              SizedBox(height: 12.h,),
              PrimaryButton(onTap: (){Navigator.pushNamed(context, RouteNames.registerScreen);}, buttonTitle: 'Sign up with Email', isRounded: true,),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.black38, thickness: .75.w,)),
                  SizedBox(width: 8.w,),
                  Text('or join with', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black54),),
                  SizedBox(width: 8.w,),
                  Expanded(child: Divider(color: Colors.black38, thickness: .75.w,)),
                ],
              ),
              SocialButtons(),
              Spacer(),
              RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.sp,
                  ),
                  children: [
                    TextSpan(
                      text: 'Sign in',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        Navigator.pushNamed(context, RouteNames.loginScreen);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h,),
            ],
          ),
        ),
      ),
    );
  }
}
