import 'package:flutter/material.dart';
import 'package:kristencrabtree/app/widgets/appbar/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kristencrabtree/core/constant/route_names.dart';

import '../../../../app/widgets/buttons/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Profile'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 20,
          children: [
            Container(
              width: double.infinity,
              // height: 50.h,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xffC6A664)),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  spacing: 10,
                  children: [
                    Image.asset('assets/images/user.png', scale: 3),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Yasir Abed Rabbu',
                          style: TextStyle(
                            color: Color(0xff201F2E),
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp,
                          ),
                        ),
                        Text(
                          'yasir@gmail.com',
                          style: TextStyle(
                            color: Color(0xff838198),
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          'Member since January 2024',
                          style: TextStyle(
                            color: Color(0xff838198),
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(
              image: 'assets/icons/account_P.svg',
              title: 'Account',
              icon: Icons.arrow_forward_ios,
              borderRadius: 20,
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.accountScreen);
              },
            ),
            CustomButton(
              image: 'assets/icons/notifications.svg',
              title: 'Notifications',
              icon: Icons.arrow_forward_ios,
              borderRadius: 20,
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.notificationScreen);
              },
            ),
            CustomButton(
              image: 'assets/icons/about.svg',
              title: 'About',
              icon: Icons.arrow_forward_ios,
              borderRadius: 20,
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.aboutScreen);
              },
            ),
            CustomButton(
              image: 'assets/icons/logout.svg',
              title: 'Logout',
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.accountScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
