import 'package:appweb/app/modules/auth/domain/entity/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    bool? auth,
    int? id,
    int? tbInstitutionId,
    String? username,
    String? password,
    String? jwt,
    String? error,
  }) : super(
          auth: auth ?? false,
          id: id ?? 0,
          tbInstitutionId: tbInstitutionId ?? 0,
          username: username ?? "",
          password: password ?? "",
          jwt: jwt ?? "",
          error: error ?? "",
        );

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      auth: json['auth'] as bool,
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      tbInstitutionId: json['tb_institution_id'] is String
          ? int.parse(json['tb_institution_id'])
          : json['tb_institution_id'],
      username: json['username'] as String,
      password: json['password'] as String,
      jwt: json['jwt'] as String,
      error: json['error'] is String ? json['error'] : "",
    );
  }
}
