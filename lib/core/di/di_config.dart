import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kristencrabtree/features/community/presentation/view_model/create_post_screen_provider.dart';
import 'package:kristencrabtree/features/exercise/presentation/view_model/emotional_body_excavation_screen_provider.dart';
import '../../features/parent/presentation/view_model/parent_screen_provider.dart';
import '../services/api_service/api_services.dart';

final GetIt getIt = GetIt.instance;

Future<void> diConfig() async {
  // ore Services
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiService>(() => ApiService());


  getIt.registerLazySingleton<ParentScreenProvider>(
        () => ParentScreenProvider(),
  );
  getIt.registerLazySingleton<EmotionalBodyExcavationScreenProvider>(
        () => EmotionalBodyExcavationScreenProvider(),
  );
  getIt.registerLazySingleton<CreatePostScreenProvider>(
        () => CreatePostScreenProvider(),
  );
}