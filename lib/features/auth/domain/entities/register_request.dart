import 'package:equatable/equatable.dart';

class RegisterRequest extends Equatable {
  final String email;
  final String password;
  final List<String> roles;

  const RegisterRequest({
    required this.email,
    required this.password,
    this.roles = const ['ROLE_USER'],
  });

  @override
  List<Object> get props => [email, password, roles];

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password, 'roles': roles};
  }
}
