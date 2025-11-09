import 'package:kristencrabtree/features/auth/presentation/view_model/reset_password_provider.dart';
import 'package:kristencrabtree/features/payment/presentation/view_model/plan_provider.dart';
import 'package:kristencrabtree/features/preference_setup/presentation/view_model/preference_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../core/di/di_config.dart';
import '../../features/auth/presentation/view_model/login/login_screen_provider.dart';
import '../../features/auth/presentation/view_model/register/register_screen_provider.dart';
import '../../features/community/presentation/view_model/create_post_screen_provider.dart';
import '../../features/exercise/presentation/view_model/emotional_body_excavation_screen_provider.dart';
import '../../features/parent/presentation/view_model/parent_screen_provider.dart';

class AppViewModels {
  static final List<SingleChildWidget> viewModels = [
    ChangeNotifierProvider<ParentScreenProvider>(create: (_) => getIt<ParentScreenProvider>(),),
    ChangeNotifierProvider<LoginScreenProvider>(create: (_) => getIt<LoginScreenProvider>(),),
    ChangeNotifierProvider<RegisterScreenProvider>(create: (_) => getIt<RegisterScreenProvider>(),),
    ChangeNotifierProvider<EmotionalBodyExcavationScreenProvider>(create: (_) => getIt<EmotionalBodyExcavationScreenProvider>(),),
    ChangeNotifierProvider<CreatePostScreenProvider>(create: (_) => getIt<CreatePostScreenProvider>(),),
    ChangeNotifierProvider<PreferenceProvider>(create: (_) => getIt<PreferenceProvider>(),),
    ChangeNotifierProvider<PlanProvider>(create: (_) => getIt<PlanProvider>(),),
    ChangeNotifierProvider<ResetPasswordProvider>(create: (_) => getIt<ResetPasswordProvider>(),),
  ];
}