import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kristencrabtree/gen/assets.gen.dart';

class CongratulationDialog {
  static Future<void> show(BuildContext context, String message, VoidCallback? onTap, String buttonTitle) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: '',
      barrierColor: Colors.transparent, // remove dark overlay
      pageBuilder: (context, _, __) {
        return Scaffold(
          backgroundColor: Colors.white, // white background fills full screen
          body: Center(
            child: Dialog(
              backgroundColor: const Color(0xFFFAF9F6),
              insetPadding: EdgeInsets.symmetric(horizontal: 32.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Circle with check
                    Container(
                      height: 48.w,
                      width: 48.w,
                      decoration: const BoxDecoration(
                        color: Color(0xFFD1AF6E),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          Assets.icons.complete,
                          height: 48.w,
                          width: 48.w,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Title
                    Text(
                      'Congratulations!',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4.h),

                    // Subtitle
                    Text(
                      message,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 20.h),

                    // Go Home Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: onTap,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD1AF6E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                        ),
                        child: Text(
                          buttonTitle,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        // Optional: simple fade + scale animation
        return FadeTransition(
          opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
          child: ScaleTransition(
            scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
            child: child,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
