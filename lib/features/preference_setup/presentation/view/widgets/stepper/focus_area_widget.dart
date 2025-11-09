import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kristencrabtree/core/constant/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../../../../app/widgets/cards/custom_card_base.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../view_model/preference_provider.dart';

class FocusAreaWidget extends StatelessWidget {
  FocusAreaWidget({super.key});

  final List<Map<String, dynamic>> focusAreaContent = [
    {
      'title': 'Mental Body',
      'subtitle': 'Explore consciousness, beliefs, and thought patterns',
      'icon': Assets.icons.brain,
      'color': Colors.blue,
    },
    {
      'title': 'Emotional Body',
      'subtitle': 'Understand feelings, emotional patterns, and triggers',
      'icon': Assets.icons.heart,
      'color': Colors.red,
    },
    {
      'title': 'Physical Body',
      'subtitle': 'Connect with body wisdom and physical sensations',
      'icon': Assets.icons.musscle,
      'color': Colors.green,
    },
    {
      'title': 'Energy Body',
      'subtitle': 'Work with subtle energies and spiritual awareness',
      'icon': Assets.icons.bolt,
      'color': Colors.purple,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PreferenceProvider>();
    final selectedIndex = provider.focusSelectedIndex;

    return Column(
      spacing: 8.h,
      children: List.generate(focusAreaContent.length, (index) {
        final item = focusAreaContent[index];
        final isSelected = index == selectedIndex;

        return GestureDetector(
          onTap: () {
            provider.setFocusIndex(index);
            provider.setPref1(item['title']);
          },
          child: CustomCardBase(
            hasPadding: false,
            borderColor: isSelected ? AppColors.primary : Colors.black12,
            bgColor: isSelected
                ? AppColors.primary.withOpacity(0.2)
                : Colors.white,
            child: ListTile(
              leading: Container(
                height: 48.w,
                width: 48.w,
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: item['color'],
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  item['icon'],
                  color: Colors.white,
                ),
              ),
              title: Text(
                item['title'],
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
              subtitle: Text(
                item['subtitle'],
              ),
              trailing: isSelected
                  ? SvgPicture.asset(Assets.icons.tikFilled, height: 20.w, width: 20.w,)
                  : null,
            ),
          ),
        );
      }),
    );
  }
}
