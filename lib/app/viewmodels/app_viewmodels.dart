import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../core/di/di_config.dart';
import '../../features/exercise/presentation/view_model/emotional_body_excavation_screen_provider.dart';
import '../../features/parent/presentation/view_model/parent_screen_provider.dart';

class AppViewModels {
  static final List<SingleChildWidget> viewModels = [
    ChangeNotifierProvider<ParentScreenProvider>(create: (_) => getIt<ParentScreenProvider>(),),
    ChangeNotifierProvider<EmotionalBodyExcavationScreenProvider>(create: (_) => getIt<EmotionalBodyExcavationScreenProvider>(),),
  ];
}