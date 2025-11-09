import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kristencrabtree/app/widgets/appbar/custom_app_bar.dart';
import 'package:kristencrabtree/app/widgets/text_field/custom_textField.dart';
import 'package:kristencrabtree/features/community/presentation/view/widget/custom_post_card.dart';

import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../widget/custom_comment_card.dart';

class PostCommentScreen extends StatefulWidget {
  const PostCommentScreen({super.key});

  @override
  State<PostCommentScreen> createState() => _PostCommentScreenState();
}

class _PostCommentScreenState extends State<PostCommentScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Post'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            spacing: 12.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPostCard(
                postCaption:
                    'Today I discovered something profound during my morning meditation. The practice of simply observing my thoughts without judgment has transformed how I experience difficult emotions. Instead of running from discomfort, I\'m learning to sit with it.',
              ),
              Text(
                'Comments (4)',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: 'Add a thoughtful comment...',
                      controller: _controller,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 40.h,
                      width: 40.h,
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: AppColors.primary,
                          width: 1.w,
                        ),
                      ),
                      child: SvgPicture.asset(
                        Assets.icons.sent,
                        height: 24.w,
                        width: 24.w,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return CustomCommentCard();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
