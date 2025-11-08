import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kristencrabtree/core/constant/route_names.dart';
import 'package:kristencrabtree/features/community/presentation/view/widget/community_screen_app_bar.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../widget/custom_post_card.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> posts = [
      {
        'caption':
            'Today I discovered something profound during my morning meditation. The practice of simply observing my thoughts without judgment has transformed how I experience difficult emotions. Instead of running from discomfort, I\'m learning to sit with it.',
        'audioUrl': null,
        'imageUrl': null,
      },
      {
        'caption':
            'Voice reflection from my evening walk. Sometimes the best insights come when we stop trying so hard.',
        'audioUrl':
            'https://dl.solahangs.com/Music/1403/02/H/128/Hiphopologist%20-%20Shakkak%20%28128%29.mp3',
        'imageUrl': null,
      },
      {
        'caption':
            'Today I discovered something profound during my morning meditation. The practice of simply observing my thoughts without judgment has transformed how I experience difficult emotions. Instead of running from discomfort, I\'m learning to sit with it.',
        'audioUrl': null,
        'imageUrl': Assets.images.post.path,
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: Column(
              spacing: 12.h,
              children: [
                CommunityScreenAppBar(),
                Column(
                  spacing: 12.h,
                  children: List.generate(posts.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteNames.postCommentScreen,
                        );
                      },
                      child: CustomPostCard(
                        postCaption: posts[index]['caption'],
                        audioUrl: posts[index]['audioUrl'],
                        imageUrl: posts[index]['imageUrl'],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
