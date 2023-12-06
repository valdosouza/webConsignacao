class AuthEntity {
  final bool auth;
  final int id;
  final int tbInstitutionId;
  final String username;
  final String password;
  final String jwt;
  final String error;

  const AuthEntity({
    required this.auth,
    required this.id,
    required this.tbInstitutionId,
    required this.username,
    required this.password,
    required this.jwt,
    required this.error,
  });
}
