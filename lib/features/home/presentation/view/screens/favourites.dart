import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app/widgets/appbar/custom_app_bar.dart';
import '../../../../../core/constant/app_colors.dart';

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Favourites'),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16,bottom: 20),
        child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context,index) {
              return Column(
                children: [
                  Container(
                    width: double.infinity,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.primary),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        spacing: 15,
                        children: [
                          Row(children: [
                            Text(
                              textAlign: TextAlign.start,
                              'Inner Journey: Discovering\nYour Authentic Self',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff1D1F2C),
                              ),
                            ),
                            SizedBox(width: 20.w,),
                            Icon(Icons.star_border,color: AppColors.primary,size: 25.sp,),
                            SizedBox(width: 5.w,),
                            Icon(Icons.share_outlined,color: Color(0xff1D1F2C),),

                          ],),
                          Text(
                            textAlign: TextAlign.start,
                            'A guided meditation to help you connect with your true essence and uncover your deepest values.',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff4A4C56),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.access_time_rounded,color: Color(0xff4A4C56),size: 15.sp,),
                              SizedBox(width: 5.w,),
                              Text('15 min',style: TextStyle(color: Color(0xff4A4C56)),),
                              SizedBox(width: 10.w,),
                              Icon(Icons.people_outline,color: Color(0xff4A4C56),size: 18.sp,),
                              SizedBox(width: 5.w,),
                              Text('892',style: TextStyle(color: Color(0xff4A4C56)),),
                              Spacer(),
                              SizedBox(
                                height: 30.h,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Icon(Icons.play_arrow_outlined,color: Colors.white,size: 20.sp,),
                                        Text(
                                          'Play',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h,)
                ],
              );
            }
        ),
      ),
    );
  }
}