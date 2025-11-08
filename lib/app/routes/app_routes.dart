import 'package:flutter/cupertino.dart';
import 'package:kristencrabtree/features/community/presentation/view/screens/create_post/create_post_screen.dart';
import 'package:kristencrabtree/features/community/presentation/view/screens/post_comment/post_comment_screen.dart';
import 'package:kristencrabtree/features/exercise/presentation/view/screens/completed/completed_screen.dart';
import 'package:kristencrabtree/features/exercise/presentation/view/screens/emotional_body_excavation/emotional_body_excavation_screen.dart';
import 'package:kristencrabtree/features/parent/presentation/view/parent_screen.dart';
import '../../core/constant/route_names.dart';
import '../../features/home/presentation/view/home_screen.dart';
import '../../features/home/presentation/view/screens/favourites.dart';
import '../../features/home/presentation/view/screens/meditation_and_wisdom.dart';
import '../../features/home/presentation/view/screens/my_quotes.dart';
import '../../features/home/presentation/view/screens/new_quote_entry.dart';

class AppRoutes {
  static String initialRoute = RouteNames.parentScreen;

  static final Map<String, WidgetBuilder> routes = {
     RouteNames.homeScreen: (context) => const HomeScreen(),
     RouteNames.parentScreen: (context) => const ParentScreen(),
     RouteNames.newQuoteEntry: (context) => const NewQuoteEntry(),
     RouteNames.myQuotes: (context) => const MyQuotes(),
     RouteNames.meditationAndWisdom: (context) => const MeditationAndWisdom(),
     RouteNames.favourites: (context) => const Favourites(),
     RouteNames.emotionalBodyExcavation: (context) => const EmotionalBodyExcavationScreen(),
     RouteNames.completedScreen: (context) => const CompletedScreen(),
     RouteNames.createPostScreen: (context) => const CreatePostScreen(),
     RouteNames.postCommentScreen: (context) => const PostCommentScreen(),

  };
}