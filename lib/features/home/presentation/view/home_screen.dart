import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kristencrabtree/core/constant/route_names.dart';

import '../../../../app/widgets/cards/custom_cards.dart';
import '../../../../gen/assets.gen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Color(0xffFFFEFA),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.r),
                bottomRight: Radius.circular(30.r),
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  top: statusBarHeight,
                  left: 16.w,
                  right: 16.w,
                ),
                color: Color(0xffC6A664),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 28.r,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            'assets/images/user.png',
                            width: 60.w,
                            height: 60.h,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Good morning, Google User',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Your growth journey continues today',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 12.h),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: SvgPicture.asset(
                        "assets/icons/notification.svg",
                        width: 38.w,
                        height: 38.h,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Row(
              spacing: 8,
              children: [
                Container(
                  width: 160.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffC6A664)),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      spacing: 12,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/excercise_completed.svg',
                          width: 25.w,
                          height: 25.h,
                        ),
                        Text(
                          '12',
                          style: TextStyle(
                            color: Color(0xff1D1F2C),
                            fontWeight: FontWeight.w400,
                            fontSize: 24.sp,
                          ),
                        ),
                        Text(
                          'Exercises Completed',
                          style: TextStyle(
                            color: Color(0xff4A4C56),
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 160.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffC6A664)),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      spacing: 12,
                      children: [
                        SvgPicture.asset(
                        Assets.icons.fire,
                          width: 25.w,
                          height: 25.h,
                        ),
                        Text(
                          '5D',
                          style: TextStyle(
                            color: Color(0xff1D1F2C),
                            fontWeight: FontWeight.w400,
                            fontSize: 24.sp,
                          ),
                        ),
                        Text(
                          'Current Streak',
                          style: TextStyle(
                            color: Color(0xff4A4C56),
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Container(
              width: double.infinity,
              height: 300.h,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffC6A664)),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 12,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/cottation.svg',
                      width: 28.w,
                      height: 28.h,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      '"The cave you fear to enter holds\nthe treasure you seek. Your\nauthentic self awaits beyond the\nlayers of conditioning."',
                      style: TextStyle(
                        color: Color(0xff4A4C56),
                        fontWeight: FontWeight.w400,
                        fontSize: 18.sp,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        Icon(Icons.favorite_outlined, color: Colors.red),
                        Icon(Icons.share_outlined, color: Colors.black),
                      ],
                    ),

                    Row(
                      spacing: 10,
                      children: [
                        ElevatedButton(
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(color: Color(0xffC6A664)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            padding: EdgeInsets.zero,
                            minimumSize: Size(50.w, 40.h),
                            elevation: 0,
                          ),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Color(0xff4A4C56),
                            size: 16.sp,
                          ),
                        ),
                        Column(
                          spacing: 8,
                          children: [
                            Text(
                              'Kristen Crabtree',
                              style: TextStyle(
                                color: Color(0xffC6A664),
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                              ),
                            ),
                            Text(
                              "Be The You That's More You",
                              style: TextStyle(
                                color: Color(0xff777980),
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(color: Color(0xffC6A664)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            padding: EdgeInsets.zero,
                            minimumSize: Size(50.w, 40.h),
                            elevation: 0,
                          ),
                          child: Icon(
                              Icons.arrow_forward_ios,
                            color: Color(0xff4A4C56),
                            size: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Row(spacing: 10,
                      children: [
                        SizedBox(
                          width: 145.w,
                          height: 35.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.white,
                              side: BorderSide(color: Color(0xffC6A664)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, RouteNames.myQuotes);
                            },
                            child: Center(
                              child: Text(
                                'My Quote',
                                style: TextStyle(
                                  color: Color(0xff4A4C56),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 145.w,
                          height: 35.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:Color(0xffC6A664),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, RouteNames.newQuoteEntry);
                            },
                            child: Center(
                              child: Text(
                                'Create Quote',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Align(
              alignment: AlignmentGeometry.topLeft,
              child: Text('Quick Actions',style: TextStyle(
                color: Color(0xff1D1F2C),fontWeight: FontWeight.w500,fontSize: 20.sp
              ),),
            ),
            SizedBox(height: 15.h),
            ExerciseGrid(),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}