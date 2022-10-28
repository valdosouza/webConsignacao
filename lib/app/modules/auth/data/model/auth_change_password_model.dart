import 'package:appweb/app/modules/auth/domain/entity/auth_change_password_entity.dart';

class AuthChangePasswordModel extends AuthChangePasswordEntity {
  AuthChangePasswordModel({
    required String userId,
    required String salt,
    required String newPassword,
  }) : super(
          userId: userId,
          salt: salt,
          newPassword: newPassword,
        );

  factory AuthChangePasswordModel.fromJson(Map<String, dynamic> json) {
    return AuthChangePasswordModel(
      userId: json['userId'] as String? ?? "",
      salt: json['salt'] as String? ?? "",
      newPassword: json['newPassword'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = int.parse(userId);
    data['salt'] = salt;
    data['newPassword'] = newPassword;
    return data;
  }
}
