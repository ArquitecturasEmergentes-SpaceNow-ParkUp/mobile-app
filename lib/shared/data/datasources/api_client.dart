import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../constants/app_constants.dart';

@injectable
class ApiClient {
  late final Dio _dio;

  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseApiUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = _getStoredToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onError: (error, handler) {
          if (error.response?.statusCode == 401) {
            _clearStoredToken();
          }
          handler.next(error);
        },
      ),
    );
  }

  Dio get dio => _dio;

  String? _getStoredToken() {
    return null;
  }

  void _clearStoredToken() {}
}
