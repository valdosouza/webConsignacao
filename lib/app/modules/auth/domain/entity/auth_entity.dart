import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final bool auth;
  final int id;
  final int institution;
  final String username;
  final String password;
  final String jwt;

  const AuthEntity(
      {required this.auth,
      required this.id,
      required this.institution,
      required this.username,
      required this.password,
      required this.jwt});

  @override
  List<Object?> get props => [auth, id, institution, username, password, jwt];
}
