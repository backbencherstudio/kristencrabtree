import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../gen/assets.gen.dart';
import '../../../home/presentation/view/home_screen.dart';
import '../view_model/parent_screen_provider.dart';

class ParentScreen extends StatefulWidget {
  const ParentScreen({super.key});

  @override
  State<ParentScreen> createState() => _ParentScreenState();
}

class _ParentScreenState extends State<ParentScreen>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
  }

  void _handleNavChange(int index) {
    context.read<ParentScreenProvider>().changeIndex(index);

    setState(() {
      _isPressed = index == 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ParentScreenProvider>(
      builder: (__, navParentProvider, child) {
        final List<Widget> pages = [
          const HomeScreen(),
          const HomeScreen(),
          const HomeScreen(),
          const HomeScreen(),
        ];

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
          left: true,
          right: true,
          top: false,
          bottom: true,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: IndexedStack(
                      index: navParentProvider.selectedIndex,
                      children: pages,
                    ),
                  ),
                  Container(
                    height: 80.h,
                    width: 390.w,
                    decoration: BoxDecoration(
                      color: Color(0xffC6A664),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 12,
                          offset: const Offset(0, 5),
                        ),
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.r),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 5.w),

                        Expanded(
                          child: _buildNavigationDestinationBar(
                            context: context,
                            index: 0,
                            label: 'Home',
                            iconPath: Assets.icons.parentHome,
                            selectedIconPath: 'assets/icons/home-selected.svg',
                            isSelected: navParentProvider.selectedIndex == 0,
                            selectedIconColor: const Color(0xffC6A664),
                            unselectedIconColor: Colors.grey.shade700,
                            width: 23.w,
                            height: 23.h,
                          ),
                        ),

                        Expanded(
                          child: _buildNavigationDestinationBar(
                            context: context,
                            index: 1,
                            label: 'Journal',
                            iconPath: Assets.icons.parentJournal,
                            selectedIconPath: 'assets/icons/search-selected.svg',
                            isSelected: navParentProvider.selectedIndex == 1,
                            selectedIconColor: const Color(0xffC6A664),
                            unselectedIconColor: Colors.grey.shade700,
                            width: 24.w,
                            height: 24.h,
                          ),
                        ),

                        Expanded(
                          child: _buildNavigationDestinationBar(
                            context: context,
                            index: 2,
                            label: 'Exercises',
                            iconPath: Assets.icons.parentExercises,
                            selectedIconPath: 'assets/icons/result_selected.svg',
                            isSelected: navParentProvider.selectedIndex == 2,
                            selectedIconColor: const Color(0xffC6A664),
                            unselectedIconColor: Colors.white,
                            width: 23.w,
                            height: 23.h,
                            shouldChangeIconColor: true,
                          ),
                        ),

                        Expanded(
                          child: _buildNavigationDestinationBar(
                            context: context,
                            index: 3,
                            label: 'Murmuration',
                            iconPath: 'assets/icons/parent_murmuration.svg',
                            selectedIconPath: 'assets/icons/profile_selected.svg',
                            isSelected: navParentProvider.selectedIndex == 3,
                            selectedIconColor: const Color(0xffC6A664),
                            unselectedIconColor: Colors.white,
                            width: 23.w,
                            height: 23.h,
                            shouldChangeIconColor: true,
                          ),
                        ),
                        SizedBox(width: 5.w),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavigationDestinationBar({
    required BuildContext context,
    required int index,
    required double width,
    required double height,
    required String label,
    required String iconPath,
    required bool isSelected,
    required String selectedIconPath,
    bool shouldChangeIconColor = false, // 👈 NEW FLAG
    Color selectedIconColor = const Color(0xffC6A664),
    Color unselectedIconColor = Colors.white,
  }) {
    return GestureDetector(
      onTap: () => _handleNavChange(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ]
              : [],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              isSelected ? selectedIconPath : iconPath,
              width: width,
              height: height,
              colorFilter: shouldChangeIconColor
                  ? ColorFilter.mode(
                isSelected ? selectedIconColor : unselectedIconColor,
                BlendMode.srcIn,
              )
                  : null,
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? selectedIconColor : Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}