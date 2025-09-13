import 'package:dartz/dartz.dart';
import '../entities/auth_response.dart';
import '../entities/login_request.dart';
import '../entities/register_request.dart';
import '../../../../shared/domain/entities/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponse>> login(LoginRequest request);
  Future<Either<Failure, AuthResponse>> register(RegisterRequest request);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, bool>> isLoggedIn();
  Future<Either<Failure, String?>> getStoredToken();
}
