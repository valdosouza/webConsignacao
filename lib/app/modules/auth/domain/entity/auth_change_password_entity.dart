class AuthChangePasswordEntity {
  int tbUserId;
  String salt;
  String newPassword;

  AuthChangePasswordEntity({
    required this.tbUserId,
    required this.salt,
    required this.newPassword,
  });
}
