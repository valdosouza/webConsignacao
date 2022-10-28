import 'package:appweb/app/modules/auth/domain/entity/auth_change_password_entity.dart';

class AuthChangePasswordModel extends AuthChangePasswordEntity {
  AuthChangePasswordModel({
    required String user,
    required String salt,
    required String newPassword,
  }) : super(
          user: user,
          salt: salt,
          newPassword: newPassword,
        );

  factory AuthChangePasswordModel.fromJson(Map<String, dynamic> json) {
    return AuthChangePasswordModel(
      user: json['user'] as String? ?? "",
      salt: json['salt'] as String? ?? "",
      newPassword: json['newPassword'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = int.parse(user);
    data['salt'] = salt;
    data['newPassword'] = newPassword;
    return data;
  }
}
