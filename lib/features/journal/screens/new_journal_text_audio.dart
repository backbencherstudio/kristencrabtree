import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../app/widgets/appbar/custom_app_bar.dart';
import '../../../../../core/constant/app_colors.dart';
import 'package:flutter_audio_waveforms/flutter_audio_waveforms.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_audio_waveforms/flutter_audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';



class NewJournalTextAudio extends StatefulWidget {
  const NewJournalTextAudio({super.key});

  @override
  State<NewJournalTextAudio> createState() => _NewJournalTextAudioState();
}

class _NewJournalTextAudioState extends State<NewJournalTextAudio>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildTab(String title, IconData icon, bool isSelected) {
    return Container(
      width: 100.w,
      height: 30.h,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : Colors.white,
        borderRadius: BorderRadius.circular(30.r),

      ),
      padding: EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.white : Color(0xff4A4C56),
            size: 20.sp,
          ),
          Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Color(0xff4A4C56),
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFEFA),
      appBar: CustomAppBar(title: 'New Journal Entry'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10,
            children: [

              Container(
                width: 230.w,
                height: 42.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: Colors.white,
                  border: Border.all(color: AppColors.primary, width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.transparent,
                    labelPadding: EdgeInsets.zero,
                    dividerColor: Colors.transparent,
                    tabs: [
                      Tab(
                        child: _buildTab(
                          "_ Text",
                          Icons.edit_outlined,
                          _tabController.index == 0,
                        ),
                      ),
                      Tab(
                        child: _buildTab(
                          "Audio",
                          Icons.mic_none,
                          _tabController.index == 1,
                        ),
                      ),
                    ],
                    onTap: (_) {
                      setState(() {});
                    },
                  ),
                ),
              ),

              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [

                    SingleChildScrollView(
                      child: Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.h,),
                          Text(
                            'Journal Title',
                            style: TextStyle(
                              color: const Color(0xff4A4C56),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Morning Reflections',
                              hintStyle: const TextStyle(
                                color: Color(0xff4A4C56),
                                fontSize: 14,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: AppColors.primary,
                                  width: 1.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: AppColors.primary,
                                  width: 2,
                                ),
                              ),
                            ),
                            style: const TextStyle(color: Colors.black),
                            cursorColor: AppColors.primary,
                          ),
                          Text(
                            'Journal Description',
                            style: TextStyle(
                              color: const Color(0xff4A4C56),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextFormField(
                            maxLines: 6,
                            decoration: InputDecoration(
                              hintText: 'Write here.....',
                              hintStyle: const TextStyle(
                                color: Color(0xff4A4C56),
                                fontSize: 14,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: AppColors.primary, width: 1.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: AppColors.primary, width: 2),
                              ),
                            ),
                            style: const TextStyle(color: Colors.black),
                            cursorColor: AppColors.primary,
                          ),
                          Text(
                            'Journal Tags',
                            style: TextStyle(
                              color: const Color(0xff4A4C56),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),



                          SizedBox(height: 10.h),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                            ),
                            onPressed: () {},
                            child: Center(
                              child: Text(
                                'Save',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),




                    // Second Tab

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}