import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kristencrabtree/app/widgets/appbar/custom_app_bar.dart';
import 'package:kristencrabtree/app/widgets/buttons/primary_button.dart';
import 'package:kristencrabtree/app/widgets/cards/custom_card_base.dart';
import 'package:kristencrabtree/app/widgets/text_field/custom_textField.dart';
import 'package:kristencrabtree/features/community/presentation/view/widget/custom_tab_bar.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../view_model/create_post_screen_provider.dart';
import '../../widget/audio_recording_widget.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _captionController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _captionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final createPostProvider = context.watch<CreatePostScreenProvider>();
    return Scaffold(
      appBar: CustomAppBar(title: 'Create Post'),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          spacing: 16.h,
          children: [
            CustomTabBar(),
            CustomTextField(
              hintText: createPostProvider.selectedIndex == 0
                  ? 'Share your thoughts, insights, or reflections with the community...'
                  : createPostProvider.selectedIndex == 1
                  ? 'Add a caption to your image...'
                  : 'Add a caption to your audio...',
              controller: _captionController,
              maxLine: createPostProvider.selectedIndex == 0 ? 6 : 1,
            ),
            if (createPostProvider.selectedIndex != 0)
              createPostProvider.selectedIndex == 1
                  ? CustomCardBase(
                      borderColor: Colors.black12,
                      child: Column(
                        spacing: 10.h,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 70.h,
                                width: 70.h,
                                decoration: BoxDecoration(
                                    color: AppColors.primary.withOpacity(.3),
                                    shape: BoxShape.circle
                                ),
                              ),
                              Container(
                                height: 48.w,
                                width: 48.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primary.withOpacity(0.3),
                                ),
                                child: SvgPicture.asset(
                                  Assets.icons.imageUp,
                                  height: 48.w,
                                  width: 48.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Tap to upload image',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            'Format: JPEG, PNG, JPG (Max: 12 Mb)',
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    )
                  : AudioRecordingWidget(),
            PrimaryButton(
              onTap: () {},
              buttonTitle: 'Publish Post',
              isRounded: true,
            ),
          ],
        ),
      ),
    );
  }
}
