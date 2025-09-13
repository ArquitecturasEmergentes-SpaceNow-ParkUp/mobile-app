class AppConstants {
  // API Configuration
  static const String baseUrl = 'https://parkup-backend.onrender.com';
  static const String apiVersion = '/api/v1';
  static const String baseApiUrl = '$baseUrl$apiVersion';

  // Endpoints
  static const String registerEndpoint = '/authentication/register';
  static const String loginEndpoint = '/authentication/login';

  // Storage Keys
  static const String tokenKey = 'auth_token';
  static const String userKey = 'user_data';

  // App Configuration
  static const String appName = 'Park Up';
  static const String appVersion = '1.0.0';

  // Theme Colors
  static const int primaryColorValue = 0xFF1605AC;

  // Validation
  static const int minPasswordLength = 6;
  static const int maxPasswordLength = 50;

  // UI Constants
  static const double defaultPadding = 16.0;
  static const double defaultRadius = 8.0;
  static const double defaultElevation = 2.0;
}
