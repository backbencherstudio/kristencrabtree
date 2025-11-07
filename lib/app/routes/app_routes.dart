import 'package:flutter/cupertino.dart';
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

  };
}