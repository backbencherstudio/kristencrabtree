import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kristencrabtree/core/constant/app_colors.dart';
import 'package:kristencrabtree/features/community/presentation/view_model/create_post_screen_provider.dart';
import 'package:provider/provider.dart';
import '../../../../../gen/assets.gen.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final createPostProvider = context.watch<CreatePostScreenProvider>();

    final List<Map<String, dynamic>> tabs = [
      {"icon": Assets.icons.editN, "label": "Text"},
      {"icon": Assets.icons.image, "label": "Image"},
      {"icon": Assets.icons.mike, "label": "Audio"},
    ];

    return Container(
      height: 36.h,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: AppColors.primary),
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(tabs.length, (index) {
          final isSelected = createPostProvider.selectedIndex == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => context.read<CreatePostScreenProvider>().setSelectedIndex(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(40.r),
                ),
                height: 32.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      tabs[index]["icon"],
                      height: 16.w,
                      width: 16.w,
                      color: isSelected ? Colors.white : Colors.black54,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      tabs[index]["label"],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black54,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
