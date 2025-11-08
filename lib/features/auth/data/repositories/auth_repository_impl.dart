import 'package:dio/dio.dart';
import '../../../../core/services/api_service/api_services.dart';
import '../../domain/repository/auth_repository.dart';

class AuthRepositoriesImpl implements AuthRepository {
  final ApiService _apiService;

  AuthRepositoriesImpl(this._apiService);

}