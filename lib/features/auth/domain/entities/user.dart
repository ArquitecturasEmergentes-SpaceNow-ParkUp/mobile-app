import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String email;
  final List<String> roles;

  const User({required this.id, required this.email, required this.roles});

  @override
  List<Object> get props => [id, email, roles];

  User copyWith({int? id, String? email, List<String>? roles}) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      roles: roles ?? this.roles,
    );
  }
}
