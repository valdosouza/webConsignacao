import 'package:appweb/app/modules/auth/domain/entity/auth_recovery_password_entity.dart';

class AuthRecoveryPasswordModel extends AuthRecoveryPasswordEntity {
  AuthRecoveryPasswordModel({
    required int tbUserId,
    required String email,
  }) : super(
          tbUserId: tbUserId,
          email: email,
        );

  factory AuthRecoveryPasswordModel.fromJson(Map<String, dynamic> json) {
    return AuthRecoveryPasswordModel(
      tbUserId: json['tb_user_id'],
      email: json['email'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tb_user_id'] = tbUserId;
    data['email'] = email;
    return data;
  }

  factory AuthRecoveryPasswordModel.empty() {
    return AuthRecoveryPasswordModel(
      tbUserId: 0,
      email: "",
    );
  }
}
