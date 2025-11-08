
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kristencrabtree/features/community/presentation/view/widget/simple_audio_player.dart';

import '../../../../../app/widgets/cards/custom_card_base.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../gen/assets.gen.dart';

class CustomPostCard extends StatelessWidget {
  const CustomPostCard({
    super.key, required this.postCaption, this.audioUrl, this.imageUrl,
  });

  final String postCaption;
  final String? audioUrl;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return CustomCardBase(
      child: Column(
        spacing: 8.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(90.r),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(90.r)
                  ),
                  child: Image.asset(Assets.images.user.path, height: 40.w, width: 40.w, fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 8.w,),
              Column(
                spacing: 2.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sarah Chen', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.black87),),
                  Text('2 hours ago', style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400, color: Colors.black54),),
                ],
              ),
              Spacer(),
              SvgPicture.asset(Assets.icons.moreVertical, height: 20.w, width: 20.w,)
            ],
          ),
          if (audioUrl != null)
            SimpleAudioPlayer(
              audioUrl: audioUrl ?? '',
            ),
          Text(postCaption, style: TextStyle(color: Colors.black54, fontSize: 14.sp, fontWeight: FontWeight.w400),),
          if (imageUrl != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Container(
                height: 250.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color:Colors.grey,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Image.asset(imageUrl ?? '', fit: BoxFit.cover,),
              ),
            ),
          Divider(
            color: Colors.grey.shade300,
            thickness: 1.w,
          ),
          Row(
            children: [
              Wrap(
                spacing: 8.w,
                children: [
                  SvgPicture.asset(Assets.icons.heart, height: 20.w, width: 20.w,),
                  Text('12', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black54),),
                ],
              ),
              SizedBox(width: 20.w,),
              Wrap(
                spacing: 8.w,
                children: [
                  SvgPicture.asset(Assets.icons.message, height: 20.w, width: 20.w,),
                  Text('12', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black54),),
                ],
              ),
              Spacer(),
              SvgPicture.asset(Assets.icons.share, height: 20.w, width: 20.w,),
            ],
          )
        ],
      ),
    );
  }
}