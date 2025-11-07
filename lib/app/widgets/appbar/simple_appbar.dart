import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final VoidCallback? onBack;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 70.h,
      backgroundColor: const Color(0xffFFFEFA),
      title: Row(
        spacing: 30,
        children: [
          if (showBackButton)
            GestureDetector(
              onTap: onBack ?? () => Navigator.pop(context),
              child: Container(
                width: 55.w,
                height: 45.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xff4A4C56),
                  size: 18,
                ),
              ),
            ),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xff1D1F2C),
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  // Required for PreferredSizeWidget
  @override
  Size get preferredSize => Size.fromHeight(80.h);
}
