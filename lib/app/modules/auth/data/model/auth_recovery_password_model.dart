import 'package:appweb/app/modules/auth/domain/entity/auth_recovery_password_entity.dart';

class AuthRecoveryPasswordModel extends AuthRecoveryPasswordEntity {
  AuthRecoveryPasswordModel({
    required String user,
    required String email,
  }) : super(
          user: user,
          email: email,
        );

  factory AuthRecoveryPasswordModel.fromJson(Map<String, dynamic> json) {
    return AuthRecoveryPasswordModel(
      user: (json['user'] as int).toString(),
      email: json['email'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user;
    data['email'] = email;
    return data;
  }

  factory AuthRecoveryPasswordModel.empty() {
    return AuthRecoveryPasswordModel(
      user: "",
      email: "",
    );
  }
}
