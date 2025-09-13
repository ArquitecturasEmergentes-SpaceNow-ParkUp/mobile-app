import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../entities/auth_response.dart';
import '../entities/register_request.dart';
import '../repositories/auth_repository.dart';
import '../../../../shared/domain/entities/failure.dart';

@injectable
class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Either<Failure, AuthResponse>> call(RegisterRequest request) async {
    return await repository.register(request);
  }
}
