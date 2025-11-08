import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/constant/route_names.dart';
import '../../../../../gen/assets.gen.dart';

final class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _moveToNextScreen();
    });
  }

  void _moveToNextScreen() async {
    await Future.delayed(
      Duration(seconds: 3),
    ).then((_) => Navigator.pushReplacementNamed(context, RouteNames.onboardingScreen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 180.h),
            Image.asset(
              Assets.images.appLogo.path,
              height: 100.h,
              width: 100.w,
            ),
            SizedBox(height: 10.h),
            Text(
              'The Dig',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'The Paramour Paradox',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 80.h),
            SizedBox(
              height: 100.h,
              width: 100.h,
              child: shimmer(
                context: context,
                name: Assets.lottie.dotLoading,
                size: 150.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget shimmer({
    String? name,
    required BuildContext context,
    Color? color,
    double? size,
  }) {
    return Center(
      child: Container(
        child: Lottie.asset(
          name ?? Assets.lottie.dotLoading,
          width: size,
          height: size,
        ),
      ),
    );
  }
}
