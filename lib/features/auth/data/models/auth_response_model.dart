import '../../domain/entities/auth_response.dart';
import 'user_model.dart';

class AuthResponseModel extends AuthResponse {
  const AuthResponseModel({required super.user, required super.token});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthResponseModel(
        user: UserModel(
          id: json['id'] as int,
          email: json['email'] as String,
          roles: const [
            'ROLE_USER',
          ], 
        ),
        token: json['token'] as String,
      );

  Map<String, dynamic> toJson() => {
    'id': (user as UserModel).id,
    'email': (user as UserModel).email,
    'token': token,
  };

  factory AuthResponseModel.fromEntity(AuthResponse response) {
    return AuthResponseModel(user: response.user, token: response.token);
  }
}
