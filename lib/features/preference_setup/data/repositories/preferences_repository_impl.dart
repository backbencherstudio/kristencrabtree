import 'package:dio/dio.dart';
import 'package:kristencrabtree/features/preference_setup/domain/repository/preferences_repository.dart';
import '../../../../core/services/api_service/api_services.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  final ApiService _apiService;

  PreferencesRepositoryImpl(this._apiService);

}