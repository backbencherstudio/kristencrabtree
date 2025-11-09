import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kristencrabtree/core/constant/route_names.dart';
import '../../core/constant/app_colors.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  bool _showAllTags = false;

  final List<String> tags = [
    'Gratitude',
    'Peace',
    'Mindfulness',
    'Growth',
    'Hope',
    'Focus'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFEFA),
      appBar: AppBar(
        toolbarHeight: 70.h,
        backgroundColor: const Color(0xffFFFEFA),
        title: Text(
          'All Journals',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
                onTap: (){Navigator.pushNamed(context, RouteNames.newJournalTextAudio);},
                child: SvgPicture.asset('assets/images/new_journal.svg')),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Color(0xffC6A664)),
                hintText: "Search by title, content, or tags.",
                hintStyle: const TextStyle(
                  color: Color(0xff757575),
                  fontSize: 14,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 0.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 1,
                  ),
                ),
              ),
              style: const TextStyle(color: Colors.black),
              cursorColor: AppColors.primary,
            ),
            SizedBox(height: 10.h),
            Text(
              'Recommended for you',
              style: TextStyle(
                color: const Color(0xff1D1F2C),
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffC6A664)),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 15,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Morning Reflections',
                          style: TextStyle(
                            color: const Color(0xff1D1F2C),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.favorite_outlined, color: Colors.red),
                        SizedBox(width: 10.w),
                        const Icon(Icons.share_rounded),
                      ],
                    ),
                    Text(
                      'Today I woke up feeling grateful for the small moments that bring joy. The sunrise reminded me that each day is a new beginning...',
                      style: TextStyle(
                        color: const Color(0xff4A4C56),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '-Sole John',
                          style: TextStyle(
                            color: const Color(0xff1D1F2C),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '2025-10-01',
                          style: TextStyle(
                            color: const Color(0xffA5A5AB),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 25.h,
                      child: ListView.builder(
                        itemCount: _showAllTags
                            ? tags.length
                            : (tags.length > 2 ? 3 : tags.length),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {

                          if (!_showAllTags &&
                              index == 2 &&
                              tags.length > 2) {
                            int remaining = tags.length - 2;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showAllTags = true;
                                });
                              },
                              child: Container(
                                width: 40.w,
                                height: 20.h,
                                margin: EdgeInsets.only(right: 8.w),
                                decoration: BoxDecoration(
                                  color: Color(0xffC6A664),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Center(
                                  child: Text(
                                    '+$remaining',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }

                          // Normal tag container
                          return Container(
                            width: 80.w,
                            height: 20.h,
                            margin: EdgeInsets.only(right: 8.w),
                            decoration: BoxDecoration(
                              color: const Color(0xffC6A664),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Center(
                              child: Text(
                                tags[index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10.h),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffC6A664)),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child:Column(
                  spacing: 15,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Morning Reflections',
                          style: TextStyle(
                            color: const Color(0xff1D1F2C),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.favorite_outlined, color: Colors.red),
                        SizedBox(width: 10.w),
                        const Icon(Icons.share_rounded),
                      ],
                    ),
                    Text(
                      'Today I woke up feeling grateful for the small moments that bring joy. The sunrise reminded me that each day is a new beginning...',
                      style: TextStyle(
                        color: const Color(0xff4A4C56),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '-Sole John',
                          style: TextStyle(
                            color: const Color(0xff1D1F2C),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '2025-10-01',
                          style: TextStyle(
                            color: const Color(0xffA5A5AB),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 25.h,
                      child: ListView.builder(
                        itemCount: _showAllTags
                            ? tags.length
                            : (tags.length > 2 ? 3 : tags.length),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {

                          if (!_showAllTags &&
                              index == 2 &&
                              tags.length > 2) {
                            int remaining = tags.length - 2;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showAllTags = true;
                                });
                              },
                              child: Container(
                                width: 40.w,
                                height: 20.h,
                                margin: EdgeInsets.only(right: 8.w),
                                decoration: BoxDecoration(
                                  color: Color(0xffC6A664),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Center(
                                  child: Text(
                                    '+$remaining',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }

                          // Normal tag container
                          return Container(
                            width: 80.w,
                            height: 20.h,
                            margin: EdgeInsets.only(right: 8.w),
                            decoration: BoxDecoration(
                              color: const Color(0xffC6A664),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Center(
                              child: Text(
                                tags[index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
