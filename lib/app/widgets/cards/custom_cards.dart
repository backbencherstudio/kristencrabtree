import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kristencrabtree/core/constant/route_names.dart';

class ExerciseGrid extends StatefulWidget {
  const ExerciseGrid({super.key});

  @override
  State<ExerciseGrid> createState() => _ExerciseGridState();
}

class _ExerciseGridState extends State<ExerciseGrid> {

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Row(
          spacing: 8,
          children: [
            _buildContainer(
              index: 0,
              iconPath: 'assets/icons/new_journal.svg',
              label: 'Exercises Completed', onTap: () {   Navigator.pushNamed(context, RouteNames.meditationAndWisdom);},
            ),
            _buildContainer(
              index: 1,
              iconPath: 'assets/icons/daily_excercise.svg',
              label: 'Daily Exercise', onTap: () {  Navigator.pushNamed(context, RouteNames.meditationAndWisdom); },
            ),
          ],
        ),
        Row(
          spacing: 8,
          children: [
            _buildContainer(
              index: 2,
              iconPath: 'assets/icons/explore.svg',
              label: 'Explore Murmuration', onTap: () {  Navigator.pushNamed(context, RouteNames.meditationAndWisdom); },
            ),
            _buildContainer(
              index: 3,
              iconPath: 'assets/icons/meditation.svg',
              label: 'Meditation & Wisdom', onTap: () {
                Navigator.pushNamed(context, RouteNames.meditationAndWisdom);
            },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContainer({
    required int index,
    required String iconPath,
    required String label,
    required VoidCallback onTap,
  }) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = isSelected ? null : index;
        });
      },
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: 160.w,
          height: 80.h,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xffC6A664) : Colors.transparent,
            border: Border.all(
              color: isSelected ? const Color(0xffC6A664) : const Color(0xffC6A664),
              width: isSelected ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 12,
              children: [
                SvgPicture.asset(
                  iconPath,
                  color: isSelected ?  Colors.white : Color(0xffC6A664),
                  width: 22.w,
                  height: 22.h,
                ),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isSelected ?  Colors.white :Color(0xff1D1F2C),
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}