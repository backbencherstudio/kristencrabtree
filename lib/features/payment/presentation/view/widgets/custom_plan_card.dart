import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../app/widgets/cards/custom_card_base.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../gen/assets.gen.dart';

class CustomPlanCard extends StatelessWidget {
  const CustomPlanCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.type,
    required this.recommendation,
    required this.features,
    this.hasIcon,
    this.tagImage,
    this.iconPath, this.borderColor,
  });

  final String title;
  final String subTitle;
  final String price;
  final String type;
  final String recommendation;
  final List<String> features;
  final bool? hasIcon;
  final String? iconPath;
  final String? tagImage;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return CustomCardBase(
      borderColor: borderColor,
      child: Column(
        spacing: 8.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          tagImage != null
              ? SizedBox(
                  height: 16.w,
                  child: Image.asset(tagImage ?? '', fit: BoxFit.fitHeight),
                )
              : SizedBox(),
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 8.w),
              hasIcon ?? false
                  ? SvgPicture.asset(iconPath ?? '', height: 20.w, width: 20.w)
                  : SizedBox(),
              Spacer(),
              Text(
                '\$$price',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subTitle,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '\\$type',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 180.w,
                child: Text(
                  recommendation,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              title == 'Annual'
                  ? Expanded(
                      child: Text(
                        '\$4.44/month\neffective',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
          Column(
            spacing: 4.h,
            children: List.generate(features.length, (index) {
              return Row(
                children: [
                  SvgPicture.asset(
                    Assets.icons.tikFilled,
                    height: 16.w,
                    width: 16.w,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      features[index],
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
          title == 'Lifetime'
              ? CustomCardBase(
            bgColor: AppColors.primary.withOpacity(0.1),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        Assets.icons.alert,
                        height: 28.w,
                        width: 28.w,
                      ),
                      SizedBox(height: 4.h,),
                      Text('One payment. A lifetime of reflection. A faster path to clarity.', textAlign: TextAlign.center, style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),)
                    ],
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
