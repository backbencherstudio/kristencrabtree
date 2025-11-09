import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kristencrabtree/features/community/presentation/view_model/create_post_screen_provider.dart';
import 'package:kristencrabtree/features/exercise/presentation/view_model/emotional_body_excavation_screen_provider.dart';
import 'package:kristencrabtree/features/payment/presentation/view_model/plan_provider.dart';
import 'package:kristencrabtree/features/preference_setup/data/repositories/preferences_repository_impl.dart';
import 'package:kristencrabtree/features/preference_setup/domain/repository/preferences_repository.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repository/auth_repository.dart';
import '../../features/auth/presentation/view_model/login/login_screen_provider.dart';
import '../../features/auth/presentation/view_model/register/register_screen_provider.dart';
import '../../features/parent/presentation/view_model/parent_screen_provider.dart';
import '../../features/preference_setup/presentation/view_model/preference_provider.dart';
import '../services/api_service/api_services.dart';

final GetIt getIt = GetIt.instance;

Future<void> diConfig() async {
  // ore Services
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiService>(() => ApiService());


  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoriesImpl(getIt<ApiService>()),);
  getIt.registerLazySingleton<PreferencesRepository>(() => PreferencesRepositoryImpl(getIt<ApiService>()),);


  getIt.registerFactory<LoginScreenProvider>(() => LoginScreenProvider(getIt<AuthRepository>()),);
  getIt.registerFactory<RegisterScreenProvider>(() => RegisterScreenProvider(getIt<AuthRepository>()),);
  getIt.registerFactory<PreferenceProvider>(() => PreferenceProvider(getIt<PreferencesRepository>()),);


  getIt.registerLazySingleton<ParentScreenProvider>(
        () => ParentScreenProvider(),
  );
  getIt.registerLazySingleton<EmotionalBodyExcavationScreenProvider>(
        () => EmotionalBodyExcavationScreenProvider(),
  );
  getIt.registerLazySingleton<CreatePostScreenProvider>(
        () => CreatePostScreenProvider(),
  );
  getIt.registerLazySingleton<PlanProvider>(
        () => PlanProvider(),
  );
}