class AuthChangePasswordEntity {
  String userId;
  String salt;
  String newPassword;

  AuthChangePasswordEntity({
    required this.userId,
    required this.salt,
    required this.newPassword,
  });
}
