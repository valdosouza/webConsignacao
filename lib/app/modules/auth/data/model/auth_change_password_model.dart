import 'package:appweb/app/modules/auth/domain/entity/auth_change_password_entity.dart';

class AuthChangePasswordModel extends AuthChangePasswordEntity {
  AuthChangePasswordModel({
    required super.tbUserId,
    required super.salt,
    required super.newPassword,
  });

  factory AuthChangePasswordModel.fromJson(Map<String, dynamic> json) {
    return AuthChangePasswordModel(
      tbUserId: json['tbUserId'],
      salt: json['salt'] as String? ?? "",
      newPassword: json['newPassword'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tb_user_id'] = tbUserId;
    data['salt'] = salt;
    data['newPassword'] = newPassword;
    return data;
  }
}
