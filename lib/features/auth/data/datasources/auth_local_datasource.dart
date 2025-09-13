import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../shared/constants/app_constants.dart';
import '../../../../shared/domain/entities/exceptions.dart';
import '../../domain/entities/auth_response.dart';
import '../models/auth_response_model.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheAuthData(AuthResponse response);
  Future<AuthResponse?> getCachedAuthData();
  Future<void> clearAuthData();
  Future<String?> getStoredToken();
  Future<void> storeToken(String token);
  Future<void> clearToken();
}

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  final FlutterSecureStorage secureStorage;

  AuthLocalDataSourceImpl(this.sharedPreferences, this.secureStorage);

  @override
  Future<void> cacheAuthData(AuthResponse response) async {
    try {
      final authJson = AuthResponseModel.fromEntity(response).toJson();
      await sharedPreferences.setString(
        AppConstants.userKey,
        authJson.toString(),
      );
    } catch (e) {
      throw const CacheException('Failed to cache auth data');
    }
  }

  @override
  Future<AuthResponse?> getCachedAuthData() async {
    try {
      final authString = sharedPreferences.getString(AppConstants.userKey);
      if (authString != null) {
        // Parse the cached data
        // This is a simplified implementation
        return null;
      }
      return null;
    } catch (e) {
      throw const CacheException('Failed to get cached auth data');
    }
  }

  @override
  Future<void> clearAuthData() async {
    try {
      await sharedPreferences.remove(AppConstants.userKey);
      await clearToken();
    } catch (e) {
      throw const CacheException('Failed to clear auth data');
    }
  }

  @override
  Future<String?> getStoredToken() async {
    try {
      return await secureStorage.read(key: AppConstants.tokenKey);
    } catch (e) {
      throw CacheException('Failed to get stored token: $e');
    }
  }

  @override
  Future<void> storeToken(String token) async {
    try {
      await secureStorage.write(key: AppConstants.tokenKey, value: token);
    } catch (e) {
      throw CacheException('Failed to store token: $e');
    }
  }

  @override
  Future<void> clearToken() async {
    try {
      await secureStorage.delete(key: AppConstants.tokenKey);
    } catch (e) {
      throw CacheException('Failed to clear token: $e');
    }
  }
}
