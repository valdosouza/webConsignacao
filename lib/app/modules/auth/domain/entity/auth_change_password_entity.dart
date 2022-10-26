class AuthChangePasswordEntity {
  String user;
  String salt;
  String newPassword;

  AuthChangePasswordEntity({
    required this.user,
    required this.salt,
    required this.newPassword,
  });
}
